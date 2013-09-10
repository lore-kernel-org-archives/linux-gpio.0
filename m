From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 1/8] ARM: plat-iop: move the GPIO driver to drivers/gpio
Date: Tue, 10 Sep 2013 16:06:37 +0300
Message-ID: <20130910130637.GC3379@blackmetal.musicnaut.iki.fi>
References: <1378741211-12884-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1378741211-12884-1-git-send-email-linus.walleij@linaro.org>
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
Cc: Mikael Pettersson <mikpe@it.uu.se>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Lennert Buytenhek <kernel@wantstofly.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Hi,

On Mon, Sep 09, 2013 at 05:40:11PM +0200, Linus Walleij wrote:
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -312,6 +312,15 @@ config GPIO_ICH
>  
>  	  If unsure, say N.
>  
> +config GPIO_IOP
> +	tristate "Intel ICH GPIO"
                        ^^^

This should probably say IOP.

A.
