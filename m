From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: pl061: lock IRQs when starting them
Date: Wed, 27 Nov 2013 08:58:03 +0100
Message-ID: <CACRpkdYqvVD9Z-B5NrGOcH9JoO53DJqEigcNshjffG0ASrLgjw@mail.gmail.com>
References: <1385472227-25956-1-git-send-email-linus.walleij@linaro.org>
	<20131127042019.GV32436@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:57850 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752090Ab3K0H6E (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2013 02:58:04 -0500
Received: by mail-ob0-f181.google.com with SMTP id uy5so6884185obc.26
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 23:58:03 -0800 (PST)
In-Reply-To: <20131127042019.GV32436@tarshish>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Deepak Sikri <deepak.sikri@st.com>

On Wed, Nov 27, 2013 at 5:20 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> On Tue, Nov 26, 2013 at 02:23:47PM +0100, Linus Walleij wrote:

>> This uses the new API for tagging GPIO lines as in use by
>> IRQs. This enforces a few semantic checks on how the underlying
>> GPIO line is used.
>
> What is this locking good for if locking is not enforced (i.e. error out)?

See commit d468bf9ecaabd3bf3a6134e5a369ced82b1d1ca1

commit d468bf9ecaabd3bf3a6134e5a369ced82b1d1ca1
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Tue Sep 24 11:54:38 2013 +0200

    gpio: add API to be strict about GPIO IRQ usage

    It is currently often possible in many GPIO drivers to request
    a GPIO line to be used as IRQ after calling gpio_to_irq() and,
    as the gpiolib is not aware of this, set the same line to
    output and start driving it, with undesired side effects.

    As it is a bogus usage scenario to request a line flagged as
    output to used as IRQ, we introduce APIs to let gpiolib track
    the use of a line as IRQ, and also set this flag from the
    userspace ABI.

    The API is symmetric so that lines can also be flagged from
    .irq_enable() and unflagged from IRQ by .irq_disable().
    The debugfs file is altered so that we see if a line is
    reserved for IRQ.

    Cc: Enric Balletbo i Serra <eballetbo@gmail.com>
    Cc: Grant Likely <grant.likely@linaro.org>
    Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
    Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
    Acked-by: Alexandre Courbot <acourbot@nvidia.com>
    Reviewed-by: Stephen Warren <swarren@nvidia.com>
    Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


Yours,
Linus Walleij
