From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [RFC] Question about freeing of resource in
 'atlas7_pinmux_probe()', in file 'drivers/pinctrl/sirf/pinctrl-atlas7.c'
Date: Tue, 20 Dec 2016 06:44:04 +0100
Message-ID: <24932cf3-0fe2-c71f-231c-c2f05c96a3c9@wanadoo.fr>
References: <612eedc5-0f28-7a38-abad-4b9573208875@wanadoo.fr>
 <7123e174-cc22-4a76-337c-661ee87994df@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:37232 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751303AbcLTFoL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2016 00:44:11 -0500
In-Reply-To: <7123e174-cc22-4a76-337c-661ee87994df@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linus.walleij@linaro.org, baohua@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Le 19/12/2016 à 14:54, Vladimir Zapolskiy a écrit :
> Functionally it looks good, I have two comments though.
> 1) you don't need to revert 151b8c5ba1eb, the commit is a proper fix
>     per se but incomplete, please add your change on top of it,
>
> 2) minimizing the lines of code by removing duplicates is always good,
>     so here a better and complete fix will be like the following one:
>
Hi,

thanks for the feedback and comments.
Patch submitted.

CJ
