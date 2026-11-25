Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627700;
	b=M8kqCCK17K2euFA/GWujnYA3C2lsc/lnsD1IV75X2YksKZ54a1IOLEknGJkFgR+8BLJ6
	 mJ4l/+EDPfI8dpUjcTggj22ELvb7ubtPTWmW+hcyQoWJxKCRqgsuWTgMuBOFBGBLyH9sk
	 sw/ViEhbvR/Uzqncv8GNIJGerB4fyYh9RnWd3YoNfbhJokQuwnZt6vLlH9BmZz9YN0A1M
	 5twAF7BESiOS9dVgBzhSaiOyXNOkPOzSjs/DcRmhcnFgGGB9Vp6845D40EUDaZnBWovag
	 qkZHD03/TLSluz88ZEDRrbeE4xK7A9sDpwqEY7zXjvpOQn6xr45oKSFPzLByG5uke4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627700;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=8h+5RP3U69j/2zVa78nMDxtSxC8teTp19AawwGi4kIQ=;
	b=daimkgh8x6HteIzSnxFvpZkmCvPWwmd0OU9yyMzumsnDjLsvut02Z1TXKp3OLe1BwMVx
	 6TlMdTz7t/+LafOkdDAiDHDSJ/TBIq+k2bL5Ef6S7SN4FJIUim+Q9up5ZCFHp+KTzR8lU
	 X2wXEijydMbn6+T5rHNNxC5JqnKI3lbfUqimzV+EqMEIJBYY3e4wgzaxQbBhG89jK9jKT
	 9Ehk1nP8/KpwIhVuux9H2jzaTfLAD/Gp6Is7CHYNEH6pMV7dut3XgZsy0TTiXIyCIJNsJ
	 S6YawEL3aq1+CdjSVjXnVLcwro+7A2EtXC9NTM7LKCy5lOBo2+b0a/7mtmL33QNvQqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7pkihfhpavb6lakjq6iwx2lajy.protonmail2 header.b=sf1UmTjD;
	arc=none smtp.remote-ip=79.135.106.28
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E4606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 17:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7pkihfhpavb6lakjq6iwx2lajy.protonmail2 header.b=sf1UmTjD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7pkihfhpavb6lakjq6iwx2lajy.protonmail2; t=1795627696;
	x=1795886896; bh=8h+5RP3U69j/2zVa78nMDxtSxC8teTp19AawwGi4kIQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sf1UmTjDLv4YsCNMdfqb07AcxEvjQqTnf78UV9m6esbU+KPDbYMpmQ2w8PPS7qQiR
	 +HkInoSZ0cpDAaE93ACbTVMoHmYTP8PqjeTugss7kLN8+kZSh8IlmlQ3eS3AjL1xmB
	 PpkGDCexGQDBx91Ky8OfOrvAcLzYJ4Ro70E9dGRjWRSXMyRdHzBLinUxybkbV/Liq/
	 idR83VE8yUhI76cRQfVBTcJlmI+vn0ctXeCkrKpJSRH/KxrbJX0YM/1O3/U37eoVzy
	 /lGuwP4lpozc8k3//nMeny7Rcl4zEt6ORR5lRo2N2H2EDS4QyxEIINU72Hl97FsVRp
	 27IvN+7GA1rYg==
Date: Wed, 25 Nov 2026 17:28:10 +0000
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
From: Norman Herms <dockseed@proton.me>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpiolib: use the of_xlate() result when hogging lines
Message-ID: <BdH-hgvZ3U7zGjPx0kKM-7SsjsgE-wN0wU4lbJykbkgUKvCLypS_PZUJBgCenst9JO7_MNMjyE6bqMmWzIsXfZIVPeoO8BQktyyEsCt1HCY=@proton.me>
In-Reply-To: <20261125-gpio-three-cell-hog-v1-1-724b15c4f0d8@oss.qualcomm.com>
References: <20261125-gpio-three-cell-hog-v1-1-724b15c4f0d8@oss.qualcomm.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 96744d9a3f8539d847b1326d39c57efcaaee3a47
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

thanks for the quick fix.

Tested on a Radxa Cubie A7S (Allwinner A733) with v7.3.6 plus our
out-of-tree A733 support patches (none of them touches gpiolib or the
sunxi of_xlate()), with this patch backported (context adjusted, the
+/- lines unchanged). Test DT: a hog on the r_pio with
gpios =3D <1 4 0> (PM4, input).

With the patch the hog is on line 36 (PM4) in /sys/kernel/debug/gpio
and PM4's function field reads 0 (input). Without it, same tree and
config otherwise, the hog is on line 1 (PL1) and PM4 stays at its
reset value 0xf. In both cases PL1 ends up with the R_I2C0 controller
and the PMIC on that bus probes.

Tested-by: Norman Herms <dockseed@proton.me>

The kernels were built and the measurements taken by an AI agent
(Claude) on my board.
