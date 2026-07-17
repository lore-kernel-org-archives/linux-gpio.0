Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379963E16A0;
	Fri, 17 Jul 2026 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286317; cv=none; b=U1iBCuV1tqENs7lCsTeKFx6G/myixbrP2wVQbMxDMVN+dJIuzT3AjTEKfrakpMtPRBT/FlXmd4WaHX4Q/sXO5/GIu8gho6Sz2m/M0DLofOP3svkwUmFQZLytkxJPlqIviGB5yHFoLosnLdjQet6W+MMWu1cbgarvQRSW8fjn6HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286317; c=relaxed/simple;
	bh=UlqPhdmESGWkKI9Ma+dfK3fztnRUwOF8AgL3P5ZuS3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucFhgf7DmOcSzmPu1DgWMAKhzKymvPITLEPSSOcBe0OAllpbfUraKgqxKUelIhl3KrluyUk9oWvFF6wGhJg3YrVZxt3iJ02GcQwOLyitlzEYaMMsN9sKxMMXOfWuJxO6ijelld5g/9XORiMf60YNjBewbdRmDso9ztyD9aPdYfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wkgNH-0007DV-00; Fri, 17 Jul 2026 13:04:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 43CF3C0138; Fri, 17 Jul 2026 13:02:04 +0200 (CEST)
Date: Fri, 17 Jul 2026 13:02:04 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup
Message-ID: <aloLrG5NUntdMt0t@alpha.franken.de>
References: <cover.1782900491.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1782900491.git.geert@linux-m68k.org>

On Wed, Jul 01, 2026 at 12:11:35PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series gets rid of legacy GPIO interface usage on the MIPS
> RBTX4927 development board, preceded and followed by some cleanups.
> No blinky LEDs were harmed during the production of this series.
> 
> Changes compared to v1[1]:
>   - Add Reviewed-by,
>   - Return early on platform_device_add() failure.
> 
> Thanks for your comments!
> 
> [1] "[PATCH 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup"
>     https://lore.kernel.org/cover.1782389357.git.geert@linux-m68k.org
> 
> Geert Uytterhoeven (9):
>   MIPS: TXX9: Remove tx4938_spi_init() and txx9_spi_init()
>   MIPS: TXX9: Remove txx9_7segled_*() forward declarations
>   MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR
>   MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
>   MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
>   MIPS: TXX9: Use GPIO lookup table for iocled LEDs
>   MIPS: TXX9: Drop GPIOLIB_LEGACY select
>   MIPS: TXX9: Convert gpio_txx9 to dynamic GPIO base allocation
>   MIPS: TXX9: Clean up txx9_iocled_init()
> 
>  arch/mips/include/asm/txx9/generic.h  |  9 +-----
>  arch/mips/include/asm/txx9/tx4938.h   |  1 -
>  arch/mips/include/asm/txx9pio.h       |  3 +-
>  arch/mips/kernel/gpio_txx9.c          |  5 ++-
>  arch/mips/txx9/Kconfig                |  1 -
>  arch/mips/txx9/generic/setup.c        | 45 ++++++++++-----------------
>  arch/mips/txx9/generic/setup_tx4938.c |  6 ----
>  arch/mips/txx9/rbtx4927/setup.c       | 41 ++++++++++++++++++------
>  8 files changed, 53 insertions(+), 58 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
