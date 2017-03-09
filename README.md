# mono-nuget-nunit-runner

This standalone runner works with a Nunit project.

First, this runner installs all dependencies using `nuget install` in `/project/packages`. Dependencies must be specified in the `packages.config` file at the project root. It will install the `NUnit-ConsoleRunner` package too. In order to be valid, the 'HintPath' for your dependencies should be `../packages`, which is the default value.

At each play, it copies the user's answer and builds the project. It then runs the provided testcase using NUnit with  a `--where "$@"` filter.

The filter syntax can be found here: [https://github.com/nunit/docs/wiki/Test-Selection-Language](https://github.com/nunit/docs/wiki/Test-Selection-Language)

# How to Use

To use this runner for your project, edit the `codingame.yml` file and add the following lines to your project:

```yaml
    runner:
      name: codingame/mono-nuget-nunit-runner
      version: 1.1.0-mono-4.8
```

## Example

**A Git Course Example**

```
.
├── about.md
├── codingame.yml
├── markdowns
│   └── <YOUR_LESSONS>.md
└── projects
    └── example              #Your project root
        ├── Example.cs       #Your UnitTest Class
        ├── Example.csproj 
        ├── Exercises
        │   ├── Exercise1.cs #The stub provided to the user
        │   └── <MORE_EXERCISES>.cs
    	└── packages.config
```

**In your CS project:**

*CourseExample.cs*
```cs
﻿using Answer;
using NUnit.Framework;
using System;

namespace CourseExample
{
    [TestFixture ()]
    public class CourseExample
    {
        [Test]
        public void VerifySum() {
            Assert.AreEqual (0,   Exercise1.DoSum (0, 0));
            /* [...] */
        }
    }
}
```

*Exercise1.cs*
```cs
﻿using System;
namespace Anwser
{
    public class Exercise1 {
        /**
        * This function should return the sum between a and b
        **/
        public static int DoSum(int a, int b){
            return 1;
        }
    }
}
```

**In your lesson:**
```md
@[Fix the following code so that the function DoSum returns a sum of integer]({"stubs": ["Exercises/Exercise1.cs"],"command": "'name == VerifySum'"})
```

# Technologies

| Technology    |     Version     |
| ------------- | --------------- |
| **Mono**      |      [4.8.0](http://www.mono-project.com/docs/about-mono/releases/4.8.0)      |
| **Nuget**      |      lastest      |
| **Nunit**     |      [lastest](https://github.com/nunit/docs/wiki/NUnit-Documentation)      |
