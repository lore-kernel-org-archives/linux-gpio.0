From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pinctrl: Qualcomm msm8916 pinctrl driver
Date: Wed, 21 Jan 2015 17:43:46 +0100
Message-ID: <CACRpkdY31g+qBumZzWgHj7ZC9rROTwE3AgLhJGB+FPtmMk6iTg@mail.gmail.com>
References: <1421745476-6276-1-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:35869 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753334AbbAUQnq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jan 2015 11:43:46 -0500
Received: by mail-ig0-f172.google.com with SMTP id l13so23300846iga.5
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2015 08:43:46 -0800 (PST)
In-Reply-To: <1421745476-6276-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Joonwoo Park <joonwoop@codeaurora.org>

On Tue, Jan 20, 2015 at 10:17 AM, Stanimir Varbanov
<svarbanov@mm-sol.com> wrote:

> This series adds a pinctrl driver for Snapdragon 410 (msm8916) SoC. T=
he first
> patch increase the register address variable size, next adds a bindin=
g document
> and the last patch adds the pinctrl driver
>
> Comments are welcome!

Bj=C3=B6rn can you look at this?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
