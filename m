Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C2DC61DA4
	for <linux-gpio@archiver.kernel.org>; Thu,  2 Feb 2023 13:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbjBBNog (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 2 Feb 2023 08:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjBBNog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 08:44:36 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E74179232
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675345475; x=1706881475;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GVuhfM7Ht0W02YrRD7N/to9p624Ypq8AMPrIhI9doUc=;
  b=hFSYs8osT1oM7AYhX41SuLuf2/XuaVLmbJpyBu28uGaTMtj9Fl4NJ6P1
   FJBOvq6Ls0ydffYmtjBEYWq/ikgHS1kA8JUNJcjihEqJHIRteXmTggI72
   SwSVB5P78QnW4+YSlukCM0sgY0Up/nYK1J7t8A2T8s7rdn8WfBki27nB2
   V36W5cpt/qbpPoPFZUBgE6OFpUIJ+c8Z1/+36akRE17E9bIb3cC60bK2s
   rBCdbkgBtxKJVKgcAoLEeBe4j3/EcDhhOuP+4VjAlpM4xxrPIqQlKQtds
   ixZ33x1d/wm4a8uH+4TEu4A61fACzpcpoIZxvVi9oogJBgzzIYcXYU3RD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316444035"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="316444035"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 05:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="773885361"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="773885361"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 05:44:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pNZtA-0006YW-2i;
        Thu, 02 Feb 2023 13:44:32 +0000
Date:   Thu, 02 Feb 2023 21:44:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 4b6b185599273ecf980e3892006a7a29c5ad653b
Message-ID: <63dbbe22.es7dSEjrhzr7xAIl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 4b6b185599273ecf980e3892006a7a29c5ad653b  pinctrl: qcom: add the tlmm driver sa8775p platforms

elapsed time: 864m

configs tested: 70
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
powerpc                           allnoconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                                defconfig
x86_64               randconfig-a001-20230130
i386                          randconfig-a001
s390                             allmodconfig
i386                          randconfig-a003
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
i386                          randconfig-a005
x86_64               randconfig-a002-20230130
x86_64               randconfig-a006-20230130
s390                             allyesconfig
x86_64               randconfig-a005-20230130
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
i386                                defconfig
i386                 randconfig-a003-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a006-20230130
i386                 randconfig-a002-20230130
i386                 randconfig-a005-20230130
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64               randconfig-a014-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
x86_64                        randconfig-k001
i386                 randconfig-a014-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a011-20230130

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
