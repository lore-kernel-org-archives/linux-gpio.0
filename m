Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8AFC4743D
	for <linux-gpio@archiver.kernel.org>; Fri, 11 Jun 2021 07:52:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CFB5613BA
	for <linux-gpio@archiver.kernel.org>; Fri, 11 Jun 2021 07:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhFKHyz (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 11 Jun 2021 03:54:55 -0400
Received: from mga02.intel.com ([134.134.136.20]:46226 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231132AbhFKHyz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Jun 2021 03:54:55 -0400
IronPort-SDR: QjN74uPTYsuvLUf2xjNkV4O1Nbc8Hftbe7l40Vw8GpWeZ4yrPruTfV64lyOs37FtK9mxLO2DoU
 CoB/ZboSYcKQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192591960"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192591960"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 00:52:57 -0700
IronPort-SDR: 0/iQilxv405MBQIjcBmXiDqeFnA22qRIjx5bOMuE6qInGN3bI+hCagpBGUZSHowyXeIqdrzIA1
 3TuW9VNSgBjQ==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="470550810"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 00:52:54 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Jun 2021 10:52:51 +0300
Date:   Fri, 11 Jun 2021 10:52:51 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Check against matching data
 instead of ACPI companion
Message-ID: <YMMWU1ZMqGoCKOoj@lahna>
References: <20210610152823.1653-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610152823.1653-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 06:28:23PM +0300, Andy Shevchenko wrote:
> In some cases we may get a platform device that has ACPI companion
> which is different to the pin control described in the ACPI tables.
> This is primarily happens when device is instantiated by board file.

Can you point which board file in the mainline kernel has this issue? If
not then I don't think it makes sense to add code like this.
