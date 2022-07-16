using OOP.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP
{
    internal class HiredProgrammers
    {
        private List<Programmer> HPGM;
        public HiredProgrammers(int capacity)
        {
            HPGM = new List<Programmer>(capacity);
        }
        public void AddNew(Programmer prog)
        {
            try
            {
                HPGM.Add(prog);
            }
            catch (IndexOutOfRangeException)
            {
                throw new Exception("Out of capacity");
            }
        }
        public int ShowFilterInfo(int underage)
        {
            int count = 0;
            foreach (Programmer prog in HPGM)
            {
                if (prog.Age <= underage)
                {
                    count++;
                }
            }

            return count;
        }
    }
}
