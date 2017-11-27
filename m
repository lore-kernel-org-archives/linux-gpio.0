From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] pinctrl: sunxi: Fix A64 UART mux value
Date: Mon, 27 Nov 2017 14:47:54 +0800
Message-ID: <CAGb2v65jB68TgGpnfZFy8K07qcM=WT5Qq9p8DQdS+eYAyc73Nw@mail.gmail.com>
References: <20171125121230.23555-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:47514 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbdK0GsU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Nov 2017 01:48:20 -0500
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com [209.85.128.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: b93043)
        by smtp.csie.ntu.edu.tw (Postfix) with ESMTPSA id 0473620526
        for <linux-gpio@vger.kernel.org>; Mon, 27 Nov 2017 14:48:18 +0800 (CST)
Received: by mail-wr0-f179.google.com with SMTP id z14so25307479wrb.8
        for <linux-gpio@vger.kernel.org>; Sun, 26 Nov 2017 22:48:17 -0800 (PST)
In-Reply-To: <20171125121230.23555-1-andre.przywara@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Nov 25, 2017 at 8:12 PM, Andre Przywara <andre.przywara@arm.com> wrote:
> To use pin PF4 as the RX signal of UART0, we have to write 0b011 into
> the respective pin controller register.
> Fix the wrong value we had in our table so far.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Fixes: 96851d391d02 ("drivers: pinctrl: add driver for Allwinner A64 SoC")
Acked-by: Chen-Yu Tsai <wens@csie.org>
