Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A913C433F5
	for <linux-gpio@archiver.kernel.org>; Mon, 30 May 2022 13:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236398AbiE3NNU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 30 May 2022 09:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbiE3NNN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2022 09:13:13 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB2027CDA;
        Mon, 30 May 2022 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653916392; x=1685452392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N3Xmznb2QDD0mF6xZ5FTVW2jO6QrXEZLzXpdo4L8kqY=;
  b=MROeUJeDTykpknOy4fkel1w6pnTQaj2JxvBVm+srPm5Wodxwr4vF/A46
   wbUybAyWnK26vgsgUe6B1NVCDTnQPINL+PH9STWrlMkQI3APPfVwhLHUQ
   GBzZy+p9mY2+IP6oxVfV06dZV+NsPZ7zcm60hVCWLnpEMqV7LqA5ZWsle
   KpGskP3rq/p02qpPQdYLVmaPNcDhwGuzVeKsdAJRe9TItpz9gbq7+Z0z9
   SshvN9J2COoCQOxBaXuWiqzfb+MdPqxGjEMZmdmtWh1nUyvbgX1LMMvOa
   RoocEJyEs2VZV+7QRcHjtkM5iif5BjYl1aifnbM7N8U9YxhEEVK7ob5/D
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274999501"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="274999501"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 06:13:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="580680131"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 06:13:08 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 30 May 2022 16:13:06 +0300
Date:   Mon, 30 May 2022 16:13:06 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        dave.hansen@linux.intel.com
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Update GPIO ACPI library to Supported
Message-ID: <YpTC4luTe41b0xy1@lahna>
References: <20220530115653.70423-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530115653.70423-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 30, 2022 at 02:56:53PM +0300, Andy Shevchenko wrote:
> The actual status of the code is Supported.
> 
> Reported-by: dave.hansen@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
