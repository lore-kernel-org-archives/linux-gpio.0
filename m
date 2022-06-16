Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83C5C433EF
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Jun 2022 03:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357829AbiFPDVs (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 15 Jun 2022 23:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349947AbiFPDVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 23:21:47 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988C75AA56
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 20:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655349706; x=1686885706;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZKQt+R6dfCZztxrRLsE+wtNC2UF3cqNpT0mBc15Eu/Q=;
  b=b9GKZcNxjL61c2qzZMMc5RV7CFsS1nU93CPu8spw/Mo92xsdEEXUBK2G
   UT7RBZ4GRuy5gqrin9/ho4fJbab1WBBmsUjVgA5IBKEw7t2vNVnL3PGYY
   piGRdqODOKQLz+W7LDoUwtLIgoPP0c47v8C0GMN/f8AHhp1HL0M7mz2nb
   i2lIGG7cRj4bjhuyJR4YRPiwwfNzrRum3B83ze4UCE8G00WkQj5ePI7xY
   MEwMU/ItvxwhrJHIUFjRvRSeYwgJd65MQvoNA9BUZwXvUutRnUXMiGwVV
   c+Y0zHn59KtW8TAfIAJPzhxgkcHBBIT9cqn7VYfSBbkKKox+Q9UDm6B1M
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="365509018"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="365509018"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 20:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="618730480"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2022 20:21:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1g4m-000NzV-EL;
        Thu, 16 Jun 2022 03:21:44 +0000
Date:   Thu, 16 Jun 2022 11:21:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-v5.20-amd-pinctrl] BUILD SUCCESS
 72440158f70f2c61e6e5b22b7409d48de62cc914
Message-ID: <62aaa1a5.TC7yeHFsswjleJp/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-v5.20-amd-pinctrl
branch HEAD: 72440158f70f2c61e6e5b22b7409d48de62cc914  pinctrl: amd: Implement pinmux functionality

elapsed time: 729m

configs tested: 53
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
