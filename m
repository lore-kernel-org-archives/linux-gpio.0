From: Timur Tabi <timur@codeaurora.org>
Subject: Sparse GPIO maps with pinctrl-msm.c?
Date: Tue, 13 Jun 2017 18:35:15 -0500
Message-ID: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:45724 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751802AbdFMXfS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2017 19:35:18 -0400
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com [209.85.218.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: timur@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 622CB607C4
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2017 23:35:17 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id k145so69953309oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2017 16:35:17 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, Andy Gross <agross@codeaurora.org>

I've run into a problem with our ACPI system where it turns out that
one a subset of GPIOs are actually available to Linux.  Attempting to
access anything that's not "approve" generates an XPU violation and
halts the system.

Our pin control driver, pinctrl-qdf2xxx.c, is a client on
pintrl-msm.c.  As such, it has to package the GPIO information in a
way that pinctrl-msm can use.  I just want to get confirmation that
there is no way to provide a list of specific GPIOs.

The actual list are these GPIOs: 116, 117, 118, 119, 120, 121, 122,
123, 124, 125, 126, 127, 128, 129, 130, 131, 80, 81, 82, 83, 84, 85,
86, 87, 88, 89, 90, 50, 36, 37, 38, 39.  These correspond to
qdss_tracedata[0 - 31].  I can create these as gpio0 - gpio31, but
that doesn't work because then no one will know (without using
debug_fs) that "gpio3" is actually GPIO 119.

I can instead create all 150 GPIOs, and then specify NULL data for the
118 unavailable GPIOs, but then if anyone tries to access any of those
(e.g. "echo 7 > /sys/class/gpio/gexport") will case a violation.

Is there a way, in pinctrl-msm, to specify a GPIO that doesn't
actually exist, and therefore should never be exported?

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
