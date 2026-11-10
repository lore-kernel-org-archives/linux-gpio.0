Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316596;
	b=4DqCJjChuSce4P5rYKahB0dbLR9hXM3cJvMrMKM+5Qf5V8Y6tCYRc4ti0FcBoGgAyz83
	 6KtseOKp9RLeIH+b+5Z3AvAaO6SVj6jCHerUvrHmwJrkjNX5uFR9jRpyBszu52oalPSBL
	 Y7waIHKYXpeh5PE584hj0972y3/peZ4JsZdQP9nbrCd0RyI0c6tura5CQUPCkTHECWJ2X
	 9WdhWcPDq1MAdrWZZKxCVaWPNPpq7x3SGZQR/UAnj/2cazVw4tQOeDro5H38l2o7Kozhz
	 rxFf18JAHzxr0Cqz3FST0qYmmgKCGF2eN5nxzpur/nQVrTtPkzHyeaTSCCnqZ+Wo0/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316596;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Yc0ntGsJW3l/wa7SL+ST9sunBXcJXAyGwZLVfV1jEDI=;
	b=0TQlu7+eIFtNNbFF/QMTTRHvSvLTMY9BWynQvP+U/CgEKv+OxZkDk4OFthihKiJWWCAu
	 vKIWtmDq1WfOJdpqDCzXdIWD7nW5BI3MTkiMNKPbK8JIBsyyVUsBG0OkYfFdlfNwE7CwA
	 Z4iw2rKCaW08HEG4N5eJ6CC7krh0KMOy2dA3O6NZUACPPpp3ac/1jvjOrnEZ6pBGw0nAX
	 KlxD2gTF1aNMVU51inaHYDMGEBWO/pJ7rw6vefkHEf7dS2G9yb7MukHewayAb2ri0O0U2
	 O2QdvHg2povhlRrDeDtn41Sy9JxleXxOQPsm2vdMPxH3tUYczmVRziwUMkXKkbYiJZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=J1ys8TFi;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6499660A3817;
	Tue, 10 Nov 2026 13:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6499660A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=J1ys8TFi
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 508AD339;
	Tue, 10 Nov 2026 05:16:31 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF0B3F632;
	Tue, 10 Nov 2026 05:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794316594; bh=ObvdDmeul27h3s8a+0chCn54N8OcJazTG19r8dFG4YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1ys8TFiZ0yGLthPcS/gBaMoX7FBqP6u1j5KtrJNHeYdhHufu/34Wn9RAdX38hZnL
	 HEZz+nPDrfPHgk32ANp59Xnvn4pgul0TEbSBrfwOJR/PpFNUacDkmvHK8MPPGf+NWN
	 FgFJweLK1WegbMiSljI47OdihIkh1VrFc5YZi9eg=
Date: Tue, 10 Nov 2026 13:16:30 +0000
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
Subject: Re: [PATCH 08/11] pinctrl: scmi: mark the GPIO functions
Message-ID: <avMZLo_fyaMu05cz@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
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
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:39PM +0100, Clément Le Goffic wrote:
> Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 1a14e254f011..24e02de543ca 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
>  {

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
