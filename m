From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/2] SoCFPGA update for v4.13
Date: Fri, 23 Jun 2017 14:03:05 +0200
Message-ID: <CAK8P3a1vZVQ5MZDU+qp62LCLnF8z-9LFH=c7XYj=ZnPUzVMjOA@mail.gmail.com>
References: <1498059352-9483-1-git-send-email-dinguyen@kernel.org> <1498059352-9483-2-git-send-email-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:35261 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751193AbdFWMDG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2017 08:03:06 -0400
Received: by mail-ot0-f194.google.com with SMTP id z48so4602678otz.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2017 05:03:06 -0700 (PDT)
In-Reply-To: <1498059352-9483-2-git-send-email-dinguyen@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

On Wed, Jun 21, 2017 at 5:35 PM, Dinh Nguyen <dinguyen@kernel.org> wrote:
> Hi Arnd, Kevin, and Olof:
>
> Please pull in this SoCFPGA Kconfig update for v4.13.

I'd like to defer this one until I hear back from the GPIO maintainers:

With this patch, CONFIG_ARCH_NR_GPIO increases from 1024 to 2048
in the ARM defconfig build. Is this ok in terms of runtime overhead?
If not, are there any alternatives?

        Arnd

> The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
>
>   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_updates_for_v4.13
>
> for you to fetch changes up to 139358be24e526bc8d050e319cdd4e2d1941503e:
>
>   ARM: socfpga: Increase max number of GPIOs (2017-06-21 10:16:02 -0500)
>
> ----------------------------------------------------------------
> SoCFPGA updates for v4.13
> - Increase number of available GPIOs in Kconfig
>
> ----------------------------------------------------------------
> Marek Vasut (1):
>       ARM: socfpga: Increase max number of GPIOs
>
>  arch/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
