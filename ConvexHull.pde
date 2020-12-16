

Polygon ConvexHullGiftWrapped( ArrayList<Point> points ){
  Polygon cHull = new Polygon();
  PVector vector1, vector2;

// if there are only three points we cannot create a polygon therefore we return the unexistem polygon.
    if(points.size() < 3)
          return cHull;
          
// lowest value for y where point is located  
 float lowestmost = 0; 
// highest value for y where point is located  
 float highestmost = 0;
// position in the array that contains the lowestmost point/  
int position = 0;
// position in the array that contains the highesttmost point/  
int highestpoint = 0;

//iterating through the points array to find lowest and highest points 
  for( int i = 0; i< points.size();i++)
  {
    // looking for the lowest point and highest point.
      if( points.get(i).p.y <  points.get(position).p.y)
      {
        lowestmost = points.get(1).p.y;
        position = i;
      }
     // looking for the hightest point and highest point.
       if( points.get(i).p.y >  points.get(position).p.y)
      {
        highestmost = points.get(1).p.y;
        highestpoint = i;
      }
  }


int originalLowest = position;
int update = 0;
// adding the lowest point into the array.
boolean flag = false;
int nextPosition = 0;
//int i = 0 ;

//iterating  until we finf that the next point equal to the initial lowest point;
while(true)
  {
 // adding to the polygon object the new point that was found to be an extreme o the polygon
    cHull.addPoint(points.get(position));
     int mod = (position + 1);
     int sizeOfarray = points.size();
     update = mod % sizeOfarray;
      int i = 0;
      // compating the current points to all the points in the array to find next extreme of hault 
       while (i < sizeOfarray) 
        { 

              // using cross produt to determine is angle is clockwise or ccw
            float cwORccw = (points.get(i).p.y - points.get(position).p.y) * (points.get(update).p.x - points.get(i).p.x) - 
              (points.get(i).p.x - points.get(position).p.x) * (points.get(update).p.y - points.get(i).p.y); 
              println("The crossproduct is=" + cwORccw);
              
           //if (val >= 1.8 && val <= 2.2) 
           // if the crossproduct is negative  we update next point since it is the most recent CCW if it is CW we keep iterating on the list. 
           if(cwORccw < 0 ){
               update = i;
             println("new cordinates are x=" + points.get(update).p.x + " Y=" + points.get(update).p.x);
                 
           }
               i++;
        } 
        // updating the position found to be the next point in hault
        position = update;
    // breaking the execution when we have found that the next point is the same as the lowest point menaing we have completed the polygon
    if( position == originalLowest)
      break;
  
 }               
  return cHull;
  
}
  
  
  
 
 
 
 
 
 
 
 
 
 
 
 
 

//      for(int j = 0 ; j < points.size(); j ++)
//          {
//                 //if(j==position)
//                 //    continue;

//                 //if(i == points.size()-1)
//                 //       continue;   
//               if(j!=position)
//               {
//                 vector1 = new PVector(points.get(j).p.x - points.get(position).p.x , points.get(j).p.y - points.get(position).p.y); 
//                vector2 = new PVector(1 , 0); 
//                float angleCalculation = PVector.angleBetween(vector2,vector1);
//                      if(angleCalculation < angleResult  )
//                     {
//                       nextPosition = j;
//                       angleResult= angleCalculation;
//                      // println("anglebetween====" + angleResult);
//                     } ;
              
//               }
//          }
  // previous approach  
// I could not approach by calculating the angle between the vectors Ihad a lot of issues understanding the vectors approach even though I use Vector 2 to be horizontal line when going counterclockwise from lowest point and swichting to a horizonlal line that point to the left once I reached the hiesht poiint. I ended up using a differenc aproach I found on Gift wrapping algorithm ( jarvis ) on wiki   
// cHull.addPoint(points.get(nextPosition));
// position = nextPosition ;
//}
//println("lowest (position in array is =" + position + " the coordinates are x=" + points.get(position).p.x + "Y===" +points.get(position).p.y); 
//println("hieghtest ( in array is =" + highestpoint + " the coordinates are x=" + points.get(highestpoint).p.x + "Y===" +points.get(highestpoint).p.y); 
 //println("returningggggg poligon");
