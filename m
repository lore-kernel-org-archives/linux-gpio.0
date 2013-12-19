From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] gpio: add missing word in gpio dt binding doc
Date: Thu, 19 Dec 2013 20:13:15 +0100
Message-ID: <20131219191315.GP8064@book.gsilab.sittig.org>
References: <1387462890-675-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387462890-675-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2013 at 15:21 +0100, Boris BREZILLON wrote:
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index e2295e3..4019ce1 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -56,7 +56,7 @@ and empty GPIO flags as accepted by the "qe_pio_e" gpio-controller.
>  2) gpio-controller nodes
>  ------------------------
>  
> -Every GPIO controller node must both an empty "gpio-controller"
> +Every GPIO controller node must contain both an empty "gpio-controller"
>  property, and have #gpio-cells contain the size of the gpio-specifier.
>  
>  It might contain GPIO hog definitions. GPIO hogging is a mechanism providing
> -- 
> 1.7.9.5

The context of the patch appears to contain stuff that gets
introduced with the RFC patch you sent out after this one.  If
this suspicion(sp?) is true, you may have to re-create the patch
on top of something official. :)  And you may want to mark this
patch as "trivial".


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
