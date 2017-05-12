From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] gpio: zynq: remove unneeded (void *) casts in
 of_match_table
Date: Fri, 12 May 2017 09:36:42 -0700
Message-ID: <20170512163641.ugh2fwqhrdhreeab@xsjsorenbubuntu.xilinx.com>
References: <1494605925-6487-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0072.outbound.protection.outlook.com ([104.47.38.72]:32016
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1757998AbdELQg4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 May 2017 12:36:56 -0400
Content-Disposition: inline
In-Reply-To: <1494605925-6487-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sat, 2017-05-13 at 01:18:45 +0900, Masahiro Yamada wrote:
> of_device_id::data is an opaque pointer.  No explicit cast is needed.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Sören Brinkmann <soren.brinkmann@xilinx.com>

	Sören
