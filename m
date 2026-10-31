Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468753;
	b=Ma7eOdfOu8FkDwJBORkQ/zHQ9/+SMZDsu+ULDJoqceVdWOS5p6km2q5+ljm9aytbs05e
	 pEumrRlkYiiq1M2Fs20Jd7o8Ft7PG02z8hRQ5CWc9HGP9RN6D/xo74/8F7wT9z+hn+Uit
	 P6o+lGSIoZKJXDjm4tPMTZ5RZuEAVIR2e4Wq7csoa06o6GA5P2qrEDUaupe2MS81KN1U/
	 ik3oOm8MIxoyxUDER34F4z0AmHYkKkq681qmEUAl35DgaCrSHoLWqEbzIB5ct6wS2gUcC
	 bAPNoFPuNCjJLoKgxybVmMNJmhY+wpv++6hhalD019YsHe4dnnCXB/BE6KD1CuAfLkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468753;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=L9XNRO5wXaN5SzdjUF0ae2LTkW1AVjbjrtX7JZ0T2mo=;
	b=v5axUdaVPwn6ltVsWWug51YvWAVpzTolcA5c/YdKXsTNdyr4CNYzFLsj1aSIuwkUDawS
	 +zBmwZKUch6XBvmpoFQTT788Q+h4fluLQNBi5U+XQTYa/SKxD+oNEEKzPwPGDA6OiLIJY
	 CWMBLB372X3ZeR8oym4nMXoAmAhtkoTntUnTrZit4G2vAfe+URm82EKawnucbIsc991sg
	 xjafF3jB5tiHntYo2iDNEGPbDx+BcMuloWmqK4vZHfFgyOW7RM1xfnHsCq4MrW0exdwXz
	 ZD+0Mlu+Yulvy7uXltZL9zV66+H33bjBYVAb2kX/IHsSvI5VD13jL3KmmeSN4ZzvvrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Max4Oim1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8D606A31A;
	Sat, 31 Oct 2026 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Max4Oim1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B441F00A17;
	Sat, 31 Oct 2026 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793468752;
	bh=L9XNRO5wXaN5SzdjUF0ae2LTkW1AVjbjrtX7JZ0T2mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Max4Oim102eV87r75SfJL5ZorPSMCEPUk+pCmc14V58cZRmbbQoErQttSMagMZDCC
	 7BQIW9c39u0GZB6Y0E1vzv9wZPmYbwUoY16rah/CbDrkvHBjGyytB01vi5n+WEgeTi
	 1TBAFnhpHnrQG0bZu51+/o3cI//Rb3A+jaJoG0hQaV5fFCBgWKXTyQRNTwNXUt2QFO
	 Vz+7lIxe1Y+ybwiWIfQ86cIZzBwKleG+JOkL5+2PGHYkTvzwvaTEHeo6OkHdYPryWS
	 zOtEpmWFqxxIkdOsHO9Gk6XgpUB3jkbGtRXRhjPYXaErdqV07lzppgDBzCblrfJMie
	 7dbMjtNIL37ag==
From: William Breathitt Gray <wbg@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Junjie Cao <junjie.cao@linux.dev>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Peter Tyser <ptyser@xes-inc.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 0/5] gpio: Move most of the Intel GPIO to the dedicated folder
Date: Sat, 31 Oct 2026 13:45:45 -0400
Message-ID: <20261031174546.3642954-1-wbg@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=443; i=wbg@kernel.org; h=from:subject; bh=L9XNRO5wXaN5SzdjUF0ae2LTkW1AVjbjrtX7JZ0T2mo=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDFnPNM2l2LrXsmuu0gipsrTdWab4WC408LZFOMexHVu1e VOe+mR3lLIwiHExyIopsvSan7374JKqxo8X87fBzGFlAhnCwMUpABOZdIORYVrX/LW+KsddLS82 v900N3GR94RtPB/XTyo8tZtPWm+/zz9Ghm/vjiV6lPCbvgrocG59UWfxYOf1dFaBNVcsL2w7VPL amwUA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Fri, Sep 25, 2026 at 05:57:02PM +0200, Andy Shevchenko wrote:
> Cc'ed to William on the point to might be hosting i8255 et alia (PC104?)
> under the 'intel/i8255' subfolder on the terms like described above for USBIO.
> Or you, William, can send me PRs, either way I don't want to maintain those.

Hi Andy,

I can stay as maintainer for the i8255 files with them hosted under the
intel folder.

Thanks,

William Breathitt Gray
