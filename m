From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/4] Revert "gpio: set up initial state from .get_direction()"
Date: Tue, 31 Oct 2017 10:33:19 -0200
Message-ID: <CAOMZO5CbPCJe76AMeRHNBUwfEu5jdWUEAqkZuxLBbgOHoLx_MQ@mail.gmail.com>
References: <1509396602-1936-1-git-send-email-timur@codeaurora.org>
 <1509396602-1936-2-git-send-email-timur@codeaurora.org> <1509440926.10233.77.camel@linux.intel.com>
 <a6c8b2ac-29de-4ec7-7b3f-fac1b5b16942@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:55870 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbdJaMdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 08:33:20 -0400
In-Reply-To: <a6c8b2ac-29de-4ec7-7b3f-fac1b5b16942@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>

On Tue, Oct 31, 2017 at 10:28 AM, Timur Tabi <timur@codeaurora.org> wrote:

> I ran checkpatch on it and it didn't complain.

In this case checkpatch should have given you an error due to the
missing Signed-off-by tag :-)
