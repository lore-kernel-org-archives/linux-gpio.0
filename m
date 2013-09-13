From: Mikael Pettersson <mikpe@it.uu.se>
Subject: Re: [PATCH 0/8] IOP GPIO refactoring
Date: Fri, 13 Sep 2013 18:07:11 +0200
Message-ID: <21043.14383.656033.487010@pilspetsen.it.uu.se>
References: <1378741198-12847-1-git-send-email-linus.walleij@linaro.org>
 <20130910141434.GD3379@blackmetal.musicnaut.iki.fi>
 <CACRpkdYbHTF0XGu-wLAeaw-nnSTEPh-ej9iizMbojmB8gzvb=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYbHTF0XGu-wLAeaw-nnSTEPh-ej9iizMbojmB8gzvb=Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mikael Pettersson <mikpe@it.uu.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Lennert Buytenhek <kernel@wantstofly.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Linus Walleij writes:
 > On Tue, Sep 10, 2013 at 4:14 PM, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
 > 
 > > With patch 6 it starts to crash on first gpio_get_value(), I guess
 > > because gpio-iop platform device is not registered on N2100...?
 > 
 > I think I've fixed this with the v2 versions of patches 1-3, you can
 > pull in and test the entire stack on Torvalds HEAD from here:
 > 
 > git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git iop-cleanup

At first I tested the v3 patch kit (1/8 v2, 2/8 v3, 3/8 v2, 4/8-8/8 v1) on top
of 3.11, but that oopsed with a near-NULL defererence due to what looked like a
timer rearm before the gpio stuff was initialized.  Then I tried the above git
as of half an hour ago and it booted fine on my n2100, even pressing the power
button worked w/o issues.

So I guess you can add

Tested-by: Mikael Pettersson <mikpe@it.uu.se>

to what's in that repo above.
