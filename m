Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633613;
	b=NlrIXJAyUr/50kGm8yevz5E6e0qFXEBczsGocKTBlqEP/5HzkkleJSCKo4SOxyVOEDQn
	 Hjig4mTitNQUHNvNaQXhfyjbdMLnbDaRKSSqFQkTGZmh9vwMju1uogZ/MG7/7nkze5VIr
	 M7bAMo++xuPsjYpf65fOFeJJm8/sRi9T5v1RvmUUvgHhldZgrU5ZFf7X63fyCkdRcw7uM
	 bUY04gaXvjBpte1+4ZfzpWrXvdlYzY2sDhe3xKO0wyOjj178hxEvf+PPL+hw4g1ohbewM
	 ViOB1iqk8VTgjgJIKoWm6mQ+NRcyz3GKmVw7TKKtHuOspqECEhyjBJn+R3fp8Efm31w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633613;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=smCWbQs6ukV3YVKhBc8urlrOvvFMyp5AAI6CWIylDvk=;
	b=PsV0/REEmUwBqk6kOSNXw/jTMKu8/C/QI7WOzcUsVi/32mZi9uPPZcHFSE1P4/9cp6c3
	 I7BEaBW3XCzBD3T2lwoaS/MJEm5V8vIkYyentxfVCSRI32coDsFYZ3aYIVlh1wAD7KllE
	 Nj035NLU/Ks33jF9Bd58aSdXEuTjo7DxAHLvI3erVaGiICBeOyeNidsk2/U6RO8qLEaoO
	 lo6PgSpmhjUqW+olHCQQNlZcuR4iM4jSmQfQaHiUUpCR8ySK7y7QEKKjU45oLbstKs0KU
	 t2goyBg7BqoInAmR0Mh4Yi3MGxu6xPtK/AeAnRMFshfmCDsaKtSqgdBF8Gwo+gFB5ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbJSDJV0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id E3F0E60DAF50;
	Mon,  2 Nov 2026 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbJSDJV0
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 94F3B1F00A16;
	Mon,  2 Nov 2026 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633612;
	bh=smCWbQs6ukV3YVKhBc8urlrOvvFMyp5AAI6CWIylDvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cbJSDJV0sJgMwWjfuXWHB3Y5W0YvW5Zk4tHJXF+csNtUtHz6TME8GVHLqZm0tvT4N
	 Vvyyp3hU+5QXLgXxjqjhBCtyBZMHZsNAjirtnYclI5SjgChPg/G0LLZNeY3oVA6JfC
	 vi3xj103MHtkJ+goSxxIdIWax7oVWysMIt4S0oPKLPnAcRO6jmk24r9cvnb/jCgmR1
	 JnY8QhGdruVbSLiRLjH3AVKuYpjDhbxCobqeQpxz356RCr2Sx3FAaSOnIveKtCSayF
	 MCMJQdlWiHpJJl2+gtSt7SKRCCUucqCgDNNRGGOmqAR0+r6dxBle+A6iNQ34BF+bkR
	 AXxLF6ZyCX58Q==
Date: Mon, 2 Nov 2026 16:33:28 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Raag Jadav <raag.jadav@intel.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 0/5] gpio: Move most of the Intel GPIO to the
 dedicated folder
Message-ID: <gxfngcnnkgkk5zrmsyrmqam6bk2ti2aflipwsutvce3dtgc7tv@nu3mmjfrt75u>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>

On Fri, Sep 25, 2026 at 05:57:02PM +0200, Andy Shevchenko wrote:
> For the easier maintenance and future development move most of Intel GPIO
> drivers to the dedicated 'intel' folder. For now it only covers the drivers
> I maintain (as per record in the MAINTAINERS).
> 

I wanted to apply this in order to see how the menuconfig looks like
with it but it doesn't apply neither to next/master nor v7.4-rc1.

Bart
