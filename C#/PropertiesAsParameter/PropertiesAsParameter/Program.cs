﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PropertiesAsParameter
{
    class Program
    {
        static void Main(string[] args)
        {
            //Initial Code - Repetitive. Can be refactored.
            Footballer f_InitialCode = new Footballer();
            f_InitialCode.FirstName = "David";
            Log(f_InitialCode.FirstName);
            f_InitialCode.LastName = "David";
            Log(f_InitialCode.LastName);
            f_InitialCode.ClubName = "Manchester United";
            Log(f_InitialCode.ClubName);
            f_InitialCode.Position = "Right Midfielder";
            Log(f_InitialCode.Position);

            //Refactor attempt #1
            //Passing properties as parameters - Not going to work as strings dont pass by reference unless explicitly stated
            //However it cannot be used as properties are not allowed to be passed as 'ref' or 'out'
            Footballer f_withoutDelegates = new Footballer();
            SetPropertyString(f_withoutDelegates.FirstName, "David");
            SetPropertyString(f_withoutDelegates.LastName, "Beckham");
            SetPropertyString(f_withoutDelegates.ClubName, "Manchester United");
            SetPropertyString(f_withoutDelegates.Position, "Right Midfielder");

            //Refactor attempt #2 - Success
            //Solution will be to use Action Delegate as shown below
            Footballer f_withDelegates = new Footballer();

            SetPropertyHelper("David", s => f_withDelegates.FirstName = s);
            SetPropertyHelper("Beckham", s => f_withDelegates.LastName = s);
            SetPropertyHelper("Manchester United", s => f_withDelegates.ClubName = s);
            SetPropertyHelper("Right Midfielder", s => f_withDelegates.Position = s);

            Console.WriteLine("Without Delegates: " + f_withoutDelegates.FirstName + "," + f_withoutDelegates.LastName + "," + f_withoutDelegates.ClubName + "," + f_withoutDelegates.Position);
            Console.WriteLine("With Delegates: " + f_withDelegates.FirstName + "," + f_withDelegates.LastName + "," + f_withDelegates.ClubName + "," + f_withDelegates.Position);
            Console.ReadLine();
        }

        private static void SetPropertyHelper(string valueToSet, Action<string> setter)
        {
            setter(valueToSet);
        }

        private static void SetPropertyString(string propertyName, string propertyValue)
        {
            propertyName = propertyValue;
            Log("Value added:" + propertyValue);
        }

        private static void Log(string logMsg)
        {
            //Does logging in real app
        }
    }

    public class Footballer
    {
        private string firstName;
        public string LastName;
        public string ClubName;
        public string Position;

        public string FirstName { get => firstName; set => firstName = value; }
    }
}
