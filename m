From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] pinctrl: sh-pfc: add r8a7795 support for voltage
 switching
Date: Mon, 13 Jun 2016 11:03:34 +0900
Message-ID: <20160613020333.GB5280@verge.net.au>
References: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdWyt2e9f=8r+q9U=BLFW2R9OSh5GCnpvsMniXWahQ_qzg@mail.gmail.com>
 <20160610111200.GB1626@katana>
 <CAMuHMdXnk2O4Q6O5OYVfdMujFEiit3pU4OD-DNL+qawgwAOyUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXnk2O4Q6O5OYVfdMujFEiit3pU4OD-DNL+qawgwAOyUw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 10, 2016 at 01:21:39PM +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Fri, Jun 10, 2016 at 1:12 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> >> BTW, are these a hard dependency for patch 3, or will the missing power
> >> source control just be ignored?
> >
> > Long answer short: It is a hard dependency.
> >
> > It shouldn't be, but fixing this might need patches to pfc, mmc-core,
> > and sdhi driver. Need to think about it. (and even then, patch 3 will be
> > depending on these yet-to-come fixes).
> 
> Thanks, good to know! ;-)
> 
> Simon: So either you can merge sh-pfc-for-v4.8 first (after I have sent the
> pull request, and Linus W. has merged it!), or the DTS update will have to wait
> for v4.9.

I prefer to wait to v4.9 unless there is a good reason no to.
