From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: improve error checking and reporting
Date: Tue, 1 Dec 2015 09:59:38 +0100
Message-ID: <CACRpkdbuiW34i+iZdujw4-sjrAY6K09BoVPxfGYsJsm4Cc6+Tg@mail.gmail.com>
References: <1447171030-15056-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34754 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755524AbbLAI7j convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 03:59:39 -0500
Received: by oies6 with SMTP id s6so113404849oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 00:59:38 -0800 (PST)
In-Reply-To: <1447171030-15056-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Nov 10, 2015 at 4:57 PM, Timur Tabi <timur@codeaurora.org> wrot=
e:

> The driver doesn't report an error message if the ACPI tables are mis=
sing
> the num-gpios property (which indicates how many GPIOs there are on t=
his
> SOC), and it didn't check to ensure that the mallocs didn't fail.
>
> Signed-off-by: Timur Tabi <timur@codeaurora.org>

Patch applied with Bj=C3=B6rn's review tag.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
