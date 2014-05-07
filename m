From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH] rfkill-gpio: Use gpio cansleep version
Date: Wed, 07 May 2014 11:02:20 +0200
Message-ID: <1399453340.10517.7.camel@jlt4.sipsolutions.net>
References: <1399392849-6021-1-git-send-email-loic.poulain@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399392849-6021-1-git-send-email-loic.poulain-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic Poulain <loic.poulain-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 2014-05-06 at 18:14 +0200, Loic Poulain wrote:

> +	if (gpiod_cansleep(rfkill->shutdown_gpio))
> +		gpiod_set_value_cansleep(rfkill->shutdown_gpio, !blocked);
> +	else
> +		gpiod_set_value(rfkill->shutdown_gpio, !blocked);
> +
> +	if (gpiod_cansleep(rfkill->reset_gpio))
> +		gpiod_set_value_cansleep(rfkill->reset_gpio, !blocked);
> +	else
> +		gpiod_set_value(rfkill->reset_gpio, !blocked);

Really? I mean, there's not even a fallback where the cansleep() API
calls the non-sleeping one if the cansleep isn't support? This is really
ugly.

johannes

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
