Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4E4E92714
	for <linux-gpio@archiver.kernel.org>; Thu,  5 Oct 2023 14:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbjJEOpc (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237385AbjJEOm1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 10:42:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD688CBCC;
        Thu,  5 Oct 2023 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696515513; x=1728051513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RDXA4Czy4/VC9pIOKgODdkItFXMtu5oF9F4uaFy5xwY=;
  b=iFzmnfBgapNqZZCc9g2EBcNTXJz48PAaJ4f7geOXPGt9BSS9zdMF6qnP
   2nEAUdVMYAwauFdbpMjTVZ3E4DZpusU7G1AdGos4mxjOl4dTTCmrLdpdI
   icPhdKZKCDKs1tewlWyjY5KFsNpubxzY0ckDnrIWxs/EWht4Z1D8x+9VK
   M1v1qwTeYFCFIEcQ8f2aoW7JceKWHzKBc71/ZZGmFwqMkanKDteLTRSbs
   g3l8ANVYCdfKXyyazirib1BGsMMCg2SiNuAhqDWnw5SN3stj8lZ734jHu
   DiUAPTP4FFRBZWZqjev3i0vzSlvyVi0uNo600BY8QJeHV/TAkGSHVCdRN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387388267"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="387388267"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 07:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817603846"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="817603846"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2023 07:18:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7879C345; Thu,  5 Oct 2023 17:18:29 +0300 (EEST)
Date:   Thu, 5 Oct 2023 17:18:29 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: denverton: Replace MODULE_ALIAS() with
 MODULE_DEVICE_TABLE()
Message-ID: <20231005141829.GV3208943@black.fi.intel.com>
References: <20231005135945.3672438-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231005135945.3672438-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 05, 2023 at 04:59:45PM +0300, Andy Shevchenko wrote:
> As Krzysztof pointed out the better is to use MODULE_DEVICE_TABLE()
> as it will be consistent with the content of the real ID table of
> the platform devices.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
