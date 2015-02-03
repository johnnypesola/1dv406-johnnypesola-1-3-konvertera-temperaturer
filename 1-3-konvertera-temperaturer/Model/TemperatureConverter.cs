using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1_3_konvertera_temperaturer.Model
{
    public static class TemperatureConverter
    {
        public static int  CelciusToFahrenheit(int degreesC)
        {
            return (int) Math.Round(degreesC * 1.8 + 32);
        }

        public static int FahrenheitToCelcius(int degreesF)
        {
            return (int) (degreesF - 32) * 5 / 9;
        }
    }
}