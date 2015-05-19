From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Tue, 19 May 2015 16:50:36 +0200
Message-ID: <CACRpkdaDZDdRnro0CmyBed8smehjAJkx_bzU_2FT5mM8GKay7w@mail.gmail.com>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
	<20150518110214.GC28127@localhost>
	<5559E3C0.1040207@linaro.org>
	<20150518150815.GH28127@localhost>
	<555A0299.3030803@linaro.org>
	<CACRpkdYs+r+oSegZuMjvg9PueWr6xB7Z-BmsHD+cmgeV=XD=Sg@mail.gmail.com>
	<555B4ABC.60304@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36482 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932488AbbESOug (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2015 10:50:36 -0400
Received: by oihb9 with SMTP id b9so12689819oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2015 07:50:36 -0700 (PDT)
In-Reply-To: <555B4ABC.60304@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 19, 2015 at 4:37 PM, Grygorii.Strashko@linaro.org
<grygorii.strashko@linaro.org> wrote:

> Any way, the question is till here - How would it better to do?
>   gpio-171 (<irq-only>          ) in  hi IRQ-209
> -- or --
>   gpio-171 ((null)          ) in  hi IRQ-209 <irq-only>

The latter I think. No strong opinion really.

Yours,
Linus Walleij
