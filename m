From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: mt7621-gpio: move out of staging
Date: Fri, 1 Jun 2018 20:13:47 +0200
Message-ID: <20180601181347.GA27486@kroah.com>
References: <1527854570-17200-1-git-send-email-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1527854570-17200-1-git-send-email-sergio.paracuellos@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: neil@brown.name, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, driverdev-devel@linuxdriverproject.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 01, 2018 at 02:02:50PM +0200, Sergio Paracuellos wrote:
> Move the mt7621-gpio driver out of staging and into mainline
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../devicetree/bindings/gpio}/mediatek,mt7621-gpio.txt             | 0
>  drivers/gpio/Kconfig                                               | 7 +++++++
>  drivers/gpio/Makefile                                              | 1 +
>  drivers/{staging/mt7621-gpio => gpio}/gpio-mt7621.c                | 0
>  drivers/staging/Kconfig                                            | 2 --
>  drivers/staging/Makefile                                           | 1 -
>  drivers/staging/mt7621-gpio/Kconfig                                | 6 ------
>  drivers/staging/mt7621-gpio/Makefile                               | 3 ---
>  drivers/staging/mt7621-gpio/TODO                                   | 3 ---

I suggest you submit this as a new driver to the gpio maintainer and
developers and then if/when it is merged into that tree, we can then
delete the staging tree version.  That makes it easier for the gpio
developers to review it and makes any cross-tree merge issues go away.

thanks,

greg k-h
