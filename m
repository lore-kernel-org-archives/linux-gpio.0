From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Fri, 16 Sep 2016 13:14:33 +0200
Message-ID: <CAMpxmJVxBGHK9Y96_6Sp4p2hCki_J=errR41zp28uBtXuDmKjA@mail.gmail.com>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net> <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
 <20160912153356.GD10121@twins.programming.kicks-ass.net> <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
 <20160915075150.GO5008@twins.programming.kicks-ass.net> <CACRpkdbbx4YA4paPGF1PtWYrPLR=dDVH8Q7FWd2gUCygT2HwtQ@mail.gmail.com>
 <CAMpxmJV+qBF4OL2WejqhdR3StmU-yOWDXVN8jJPWVTiMOJQxjg@mail.gmail.com>
 <20160915133922.GE5016@twins.programming.kicks-ass.net> <20160916105626.GH5020@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160916105626.GH5020@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2016-09-16 12:56 GMT+02:00 Peter Zijlstra <peterz@infradead.org>:
> On Thu, Sep 15, 2016 at 03:39:22PM +0200, Peter Zijlstra wrote:
>
>> In any case, if this fails, we can always punt and simply count the
>> total number of instances of this driver on the system and go with that.
>
> One caveat with that approach is that if this is s module, someone doing
> rmmod, insmod a number of times gets tricky.

The whole thing is a bit more complicated - I'm trying to figure out
the code behind it, but the first expander has four parents whose
driver == pca953x, while the second has five of them. There is no
device name, but kobj->name corresponds with the i2c device
sub-directories on correct addresses and busses (1-0021 for the first
one and 4-0020 for the second on my board).

With both devices having pca953x parents I still can't tell one from
another. Still working on it.

Thanks,
Bartosz Golaszewski
