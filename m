From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFT v4] gpio: gpio-rcar: Support S2RAM
Date: Thu, 15 Feb 2018 17:26:26 +0100
Message-ID: <20180215162626.spplofxvw5qvxgdr@verge.net.au>
References: <1517771702-16984-1-git-send-email-ykaneko0929@gmail.com>
 <TY1PR06MB099277F0F160247B270EE165D8F50@TY1PR06MB0992.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <TY1PR06MB099277F0F160247B270EE165D8F50@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, DUNG NGUYEN <dung.nguyen.aj@renesas.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 14, 2018 at 05:27:39AM +0000, Yoshihiro Shimoda wrote:
> Hi,
> 
> > From: Yoshihiro Kaneko, Sent: Monday, February 5, 2018 4:15 AM
> > 
> > From: Hien Dang <hien.dang.eb@renesas.com>
> > 
> > This patch adds an implementation that saves and restores the state of
> > GPIO configuration on suspend and resume.
> > 
> > Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [Modify structure of the bank info to simplify a saving registers]
> > [Remove DEV_PM_OPS macro]
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > ---
> 
> Thank you for the patch. Our team tested this patch and
> an issue that an SD card detection pin doesn't work after resumed is resolved.
> So,
> 
> Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>

Thanks for testing!

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
