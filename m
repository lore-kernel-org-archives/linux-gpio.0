From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: Fix the error path
Date: Wed, 6 Apr 2016 15:40:36 +0200
Message-ID: <CACRpkdZna_Bznio84enjjsegZVt+SAOGc-mSc9H7Dqq8PCotfg@mail.gmail.com>
References: <1459793646-16000-1-git-send-email-shubhraj@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36233 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771AbcDFNkh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2016 09:40:37 -0400
Received: by mail-oi0-f48.google.com with SMTP id y204so58119212oie.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2016 06:40:37 -0700 (PDT)
In-Reply-To: <1459793646-16000-1-git-send-email-shubhraj@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>

On Mon, Apr 4, 2016 at 8:14 PM, Shubhrajyoti Datta
<shubhrajyoti.datta@xilinx.com> wrote:

> pm_runtime_disable is called only in remove it is missed
> out in the error path.
> Fix the same.
>
> Signed-off-by: Shubhrajyoti Datta <shubhraj@xilinx.com>

Patch applied.

Yours,
Linus Walleij
