From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] gpio: Add driver for PC Engines APU2/APU3 GPIOs
Date: Fri, 03 Aug 2018 09:08:27 -0700
Message-ID: <bd1182e9417da5f1aa13659870e333d26c4be35a.camel@perches.com>
References: <20180801111243.2848-1-fe@dev.tdt.de>
         <CACRpkdbY3w-ptUOkv5TUZh+5oEGU+4BLO_6=12QecRveTSBKSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbY3w-ptUOkv5TUZh+5oEGU+4BLO_6=12QecRveTSBKSQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, fe@dev.tdt.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, 2018-08-02 at 23:30 +0200, Linus Walleij wrote:
> On Wed, Aug 1, 2018 at 1:12 PM Florian Eckert <fe@dev.tdt.de> wrote:
[]
> > +       spinlock_t lock;
> 
> I think checkpatch now mandates that you put in a comment
> about what this lock is locking.

Please remember that checkpatch doesn't mandate anything.

Documentation/process/4.Coding.rst does have:

   Certain things should always be commented.  Uses of memory barriers should
   be accompanied by a line explaining why the barrier is necessary.  The
   locking rules for data structures generally need to be explained somewhere.

So there should be some comment somewhere in the code
for the spinlock.
