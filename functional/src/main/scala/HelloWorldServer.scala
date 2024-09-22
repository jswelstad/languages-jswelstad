import akka.actor.typed.ActorSystem
import akka.actor.typed.scaladsl.Behaviors
import akka.http.scaladsl.Http
import akka.http.scaladsl.model.StatusCodes
import akka.http.scaladsl.server.Directives._
import akka.http.scaladsl.model.ContentTypes
import akka.http.scaladsl.model.HttpEntity

import scala.io.StdIn
import scala.util.parsing.json.JSON

object HelloWorldServer {

  def main(args: Array[String]): Unit = {
    // Create an ActorSystem
    implicit val system = ActorSystem(Behaviors.empty, "helloWorldSystem")
    implicit val executionContext = system.executionContext

    // Define the route
    val route =
      path("greet" / Segment) { person =>
        get {
          complete(s"Hello, $person!")
        }
      } ~
      path("sortStrings") {
        post {
          entity(as[String]) { jsonString =>
            //Parse the incoming JSON and sort the strings
            val stringsList = parseJsonStringList(jsonString)
            val sortedList = stringsList.sorted

            //Convert the sorted list back to JSON format
            val sortedJson = s"""{"Sorted Strings": [${sortedList.map(str => "\"" + str + "\"").mkString(",")}]}"""

            //Respond with the sorted list
            complete(HttpEntity(ContentTypes.`application/json`, sortedJson))
          }
        }
      }

    // Start the server
    val bindingFuture = Http().newServerAt("localhost", 8080).bind(route)

    println("Server online at http://localhost:8080/\nPress RETURN to stop...")
    StdIn.readLine() // Keep the server running until user presses return
    bindingFuture
      .flatMap(_.unbind()) // Unbind from the port
      .onComplete(_ => system.terminate()) // Terminate the system when done
  }

  def parseJsonStringList(jsonString: String): List[String] = {
    // Parse the JSON string
    JSON.parseFull(jsonString) match {
      case Some(map: Map[String, List[String]] @unchecked) =>
        map.getOrElse("strings", List.empty[String])
      case _ => List.empty[String]
    }
  }
}
