From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] Fix no. of gpio cells in the pxa gpio binding doucmentation
Date: Sun, 18 Sep 2016 19:23:00 +0200
Message-ID: <871t0hf7gr.fsf@belgarion.home>
References: <57CD0EB8.1030500@zilogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:50957 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751581AbcIRRXD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2016 13:23:03 -0400
In-Reply-To: <57CD0EB8.1030500@zilogic.com> (Vijay Kumar's message of "Mon, 05
        Sep 2016 11:50:40 +0530")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vijay Kumar <vijaykumar@zilogic.com>
Cc: linux-gpio@vger.kernel.org

Vijay Kumar <vijaykumar@zilogic.com> writes:

> Fix the no. of gpio cells in pxa gpio binding documentation.
>
> The no. of gpio cells for the pxa gpio is actually 2. But is
> incorrectly specified as 1, in the binding documentation. From the
> driver code, the second cell specifies the standard flags as described
> in gpio.txt.
>
> Signed-off-by: Vijay Kumar B. <vijaykumar@zilogic.com>

Yes, that's correct. I'll add this to pxa/dt tree, thanks.

Cheers.

--
Robert
