Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10777C433F5
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Feb 2022 15:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239550AbiBUP1m (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 21 Feb 2022 10:27:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344601AbiBUP1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:27:40 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE5C1EAD0;
        Mon, 21 Feb 2022 07:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645457237; x=1676993237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YheXgA/w0kWmZiHgabea6UMdQrnEpsk76xiXGIY5Z1k=;
  b=T6f/rUKmlfWk1EYChztwif94jiGGltUiEMHTIZZDd2B+IXJb6J1pbGWS
   oNO7yJzxpLXLw5Rv8P/Xxy0AIoRaGARm0JQ38aVYIfLNjG+n60CkW9rH3
   1fuFRsY/+VJCwYFnmhYjeQQgibgcGZY7hAZFobEFIuQBwJCubBlpqF6qG
   UUpmCWJc3fKLqyANRa1OBT/u2pHakPsHCTk6StBsP84kvnpHWa+M1a57C
   G1fkTWeR6XfsDc8eFSqD3PBM4bh1f3Hkkde8QmQukvaY6sZgaSWCDhkus
   TOC4+YS8sQ4640RRylAb2E8znGSh1IFKVdziXhqB8S0MuWcsTliCgGhPl
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250346521"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="250346521"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 07:27:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="505116097"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 07:27:14 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Feb 2022 17:24:59 +0200
Date:   Mon, 21 Feb 2022 17:24:59 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/4] pinctrl: alderlake: Add Raptor Lake-S ACPI ID
Message-ID: <YhOrxJJ5F+gQk58Z@lahna>
References: <20220215152800.21104-1-andriy.shevchenko@linux.intel.com>
 <20220215152800.21104-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215152800.21104-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 15, 2022 at 05:27:58PM +0200, Andy Shevchenko wrote:
> Intel Raptor Lake-S PCH has the same GPIO hardware than Alder Lake-S PCH
> but the ACPI ID is different. Add this new ACPI ID to the list of supported
> devices.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
