Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8374A40927D;
	Wed, 23 Sep 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173003; cv=none; b=dFhPOLztBRLVzbN3jqklYEvcoPkyEkCuhGhWoRUk50afrkHYn0HJoWe5mdNOed0tDcfmcdHJp3wRSMH0xR3prkaJn8XAQxyLDTp3VD+l38ev5p4fWrWHujBdu6Yo0ildVHY1WpsxvzW69Lx36OCvMUk+uV3vULj7DuS1dtCbedk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173003; c=relaxed/simple;
	bh=pjn94+QqUnplTf/Lw8dWChtvZoqbVQzZ8y3uw2QFkK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=POnV/+WoQD9A2Col0uubv7m4EqWQUopy8ahbem3OpPGygLotD8C1S8yv8gma0CS3l6vjPEorApdKmeHVuDsqj0ZAN3vQDI47HkSlUxaiq+dBNZVehVupRwJnOkixPgRMKOk0U65PfCqEUD+oLV0NoO6cr9P0Y2MJNz0T0ZzAkGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Gx8orI2C; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Gx8orI2C"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7320D152B;
	Wed, 23 Sep 2026 07:16:37 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551B43F86C;
	Wed, 23 Sep 2026 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790173001; bh=pjn94+QqUnplTf/Lw8dWChtvZoqbVQzZ8y3uw2QFkK0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gx8orI2ClszWd17W6QarNcdz4HjWcAVSUfocdkWWupY7BYnCdOl1+ghmFEZznYJ7X
	 rZUKyAfbgqhAIeBAo+EAgkpUgGl63WGXSVl8onWaaUU6DzMO8L3XdhAqijee00jNWV
	 IDeczs3B4hH++oOrlYSfwTCms1AeMaB4V4aEJ8qI=
Date: Wed, 23 Sep 2026 15:16:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
Message-ID: <arPfRFC5jzVaSQvq@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-arm64-have-shared-gpios-v1-1-31af942ab30f@oss.qualcomm.com>

On Mon, Sep 07, 2026 at 04:50:34PM +0200, Bartosz Golaszewski wrote:
> Shared GPIO management provided by the GPIO shared proxy module has been
> enabled for Qualcomm platforms for some time. By extension of the
> defconfig, it's been effectively enabled for all ARM64 platforms when
> using the default configuration. Bugs discovered initially after the
> feature was first enabled, were fixed and I haven't seen any new reports
> for several months. Make the feature enabled by default for all ARM64
> platforms officially, which will allow us to continue the removal of the
> deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/Kconfig           | 1 +
>  arch/arm64/Kconfig.platforms | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)

Since it touches more lines in Kconfig.platforms (2 vs 1), I'd leave
this to the arm-soc people to merge (I also got a minor conflict in
Kconfig.platforms).

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
