From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 18/23] metag: remove ARCH_WANT_OPTIONAL_GPIOLIB
Date: Tue, 26 Apr 2016 13:40:16 +0200
Message-ID: <CACRpkdZf9xMpPVg-yUysuhjQgm005e_4MPje8qngLiszPZiz3Q@mail.gmail.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
	<1461142701-21096-19-git-send-email-linus.walleij@linaro.org>
	<20160420092602.GX7859@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160420092602.GX7859-4bYivNCBEGTR3KXKvIWQxtm+Uo4AYnCiHZ5vskTnxNA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 20, 2016 at 11:26 AM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> =
wrote:
> On Wed, Apr 20, 2016 at 10:58:16AM +0200, Linus Walleij wrote:
>> This symbols is not needed to get access to selecting the
>> GPIOLIB anymore: any arch can select GPIOLIB.
>>
>> Cc: Michael B=C3=BCsch <m@bues.ch>
>> Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>> Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Acked-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Applied to the GPIO tree for v4.7 with your ACK, thanks!

Yours,
Linus Walleij
