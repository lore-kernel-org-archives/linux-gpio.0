From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND][PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO
 driver
Date: Fri, 28 Apr 2017 09:27:58 +0100
Message-ID: <20170428082758.or35djbh3gqikz5e@dell>
References: <20170425183210.30594-1-marek.vasut+renesas@gmail.com>
 <20170425183210.30594-3-marek.vasut+renesas@gmail.com>
 <CACRpkdbpQ=Q6zt8uzfDCvOUU40S5aEvbvNd4OP4uVwBzQJhzQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbpQ=Q6zt8uzfDCvOUU40S5aEvbvNd4OP4uVwBzQJhzQQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marek.vasut@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Fri, 28 Apr 2017, Linus Walleij wrote:

> On Tue, Apr 25, 2017 at 8:32 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> 
> > Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
> > This block is pretty trivial and supports setting GPIO direction
> > as Input/Output and in case of Output, supports setting value.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: linux-gpio@vger.kernel.org
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > V2: Use linux/gpio/driver.h instead of linux/gpio.h
> 
> I applied this for v4.12 to bring down the number of deps in
> v4.13. The guarding symbol makes it not compile until the MFD
> patch is there, the MFD_BD9571MWV is unlikely to change,
> and Marek will certainly go through with the driver submission.

Works for me.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
