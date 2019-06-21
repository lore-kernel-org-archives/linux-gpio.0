Return-Path: <SRS0=CuJ+=UU=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8B8C48BE0
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Jun 2019 20:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1DD42070B
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Jun 2019 20:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfFUUrr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 Jun 2019 16:47:47 -0400
Received: from smtprelay0017.hostedemail.com ([216.40.44.17]:47836 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725985AbfFUUrr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Jun 2019 16:47:47 -0400
X-Greylist: delayed 491 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Jun 2019 16:47:46 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id A9DC0180222AF;
        Fri, 21 Jun 2019 20:39:34 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id A98EA18224D93;
        Fri, 21 Jun 2019 20:39:33 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: space09_530743a0b544e
X-Filterd-Recvd-Size: 2484
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Fri, 21 Jun 2019 20:39:30 +0000 (UTC)
Message-ID: <67f6cd269684c9aa8463ff4812c3b4605e6739c3.camel@perches.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Fix CONFIG preprocessor guard
From:   Joe Perches <joe@perches.com>
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Lee Jones <lee.jones@linaro.org>,
        Michal Simek <monstr@monstr.eu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Date:   Fri, 21 Jun 2019 13:39:28 -0700
In-Reply-To: <20190621202043.95967-1-natechancellor@gmail.com>
References: <20190621202043.95967-1-natechancellor@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2019-06-21 at 13:20 -0700, Nathan Chancellor wrote:
> Clang warns when CONFIG_ACPI is unset:

Any of these others need the same s/#if/#ifdef/ ?

$ git grep -P '^\s*#\s*if\s+CONFIG_[A-Z0-9_]+\s*$' *
arch/microblaze/include/asm/exceptions.h:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/microblaze/include/asm/hash.h:#if CONFIG_XILINX_MICROBLAZE0_USE_BARREL
arch/microblaze/include/asm/irqflags.h:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/microblaze/kernel/entry-nommu.S:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/microblaze/kernel/entry.S:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/microblaze/kernel/entry.S:#if CONFIG_MANUAL_RESET_VECTOR
arch/microblaze/kernel/setup.c:#if CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR
arch/powerpc/platforms/powernv/pci.c:#if CONFIG_EEH
arch/x86/boot/compressed/misc.c:#if CONFIG_X86_NEED_RELOCS
arch/x86/boot/compressed/misc.h:#if CONFIG_RANDOMIZE_BASE
drivers/pinctrl/qcom/pinctrl-sdm845.c:#if CONFIG_ACPI
kernel/futex.c:#if CONFIG_BASE_SMALL



