Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309864;
	b=WBKpA9wpNFkfuw5MnEPsuuaF0utozwIJ1KIt4HWp3VOQheqQIHOduzRdltgmuKkqoZn5
	 1hpxuWN69JYZ+DY4wQUGotLv8oIWtqDu1NJT+QYmNNfGnZ4xZPM1xnYicoIJZ/5Q20bN5
	 LhPta6A+jm8qfpdq5CA/deLHY74TwKKsDA7gRtHYzADM0xTtq6Q+M/9gH9fCjbLLVjYJg
	 FIlIlqSHy0AkQ9q2qsBr0Iwaz/Ntu9G8wkGgCma+OeMA5lITGdaSOf0Ru9AQx8jZJ0IOo
	 eB/2pjhMyNO2hXdH1T0FsUoUTJo2XhehJuxyQ+dNry8HRuX3gVVVcToA9B3WD1F2diQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309864;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=RY2GDlGT68AR2QXKr/Pg/7SwlxNnwdJ/mLPKQYtsMK4=;
	b=yBl/ZIrr/PMBZ4V60bj2rxmM3gn6viJwheqG+qjiBjhgO5hzUBqQyrXZKAPO22i6DDYa
	 y3Tue9IyBTdKfW9W8KBH7fHkvGLyqzs/BX2O994WaAJDQiyCdqqzVyuyf45JsCKhjpRPc
	 jzX2cTCeg79Wg80MuZW0GcK2tMHWuqbPm2b11e//FooDR6byny+y1C9ikLYrC8QK4d7NV
	 Y4YU19XIi6ucQRisiRzRim6ptF40I/bntb3vtDMzMZA/KbeizZc+rGXH+fPYq23+Lo+os
	 QXV5C4fd0h9eZTuajN6AhpJM/py5+G0h4htkIyhba592EtabTPWbVFaO6uOhEtswIeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a+8kM02d;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C57C60A2638;
	Tue, 10 Nov 2026 11:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C57C60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a+8kM02d
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A53D21516;
	Tue, 10 Nov 2026 03:24:19 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2A373F632;
	Tue, 10 Nov 2026 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794309862; bh=TLxKayf25V8XHxhG5kQm67heVMxYl5VFUbr14gA+T2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+8kM02d1K5ZEuDte3jfNGSA7Vg/ozX/K/YoAuzqXpsVSMpPEqUhjG1Puuw0PGJeF
	 78vtrohEVFGNDb/91zKv8Yg1sBs4OZ3KsEpnQtgr8de1kjewzHTa72+DRSyZ6kU8TC
	 EAF7m1ugLthutmcccBpEYmLrjllPwzoF3QgwMsXg=
Date: Tue, 10 Nov 2026 11:24:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
Message-ID: <avL-4lquUqW9lUNh@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
> A get of a setting that is on or off, the flags and the pulls, returned
> 0 as a value, so every one of them showed as set on every pin. Return
> -EINVAL when the platform answers 0, which is how pinconf reports a
> setting that is not active.
> 
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
