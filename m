Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516540;
	b=mIFmyL2oy8vSqIAyCPvAUYhHo16gQO1T5+CwoOfC18ANcWSMmjhihSFTb0lpCntsfOSb
	 0H4WlAwqt1sgPgQdYtrDFur2S44jliAdqsgyW3kdZDfHOyKDZ9Y056CrPyPF3o3kGkpAJ
	 t7G6rMHpnfPlrPS/5xo/Os6HvUMjtPKZ0bkcFPvXAB8/A/15jy4g+hsMg2t9bVDfzEZZn
	 GiMhIqLnDTgtwPlW+XSNdObKRKObJ76YD179qr5H+QilsMNrB7bXJBjhO3c+Z/XjkMCy1
	 VhTegbp3MK8KCra0ftnIdL9ezs99n2PnFkVk32SL5eO//Kgivp+Eeb0irXSzKxj2eLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516540;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gcHnGr+EWKizS1GumnjfLSnWqHQiWDkKEJikRlAsFBE=;
	b=DvDjr4NvWnzdWVW5nFv/5yY/zHw19DRaMG9RVdjeINGJcxTPypmNXbc8+0AaIAnWw48C
	 SYLozFqFXCy0s5/vF/Zk5MJ1v8P0RXiaTvcs90WxboCYzkc88RPHhgMZE+WX6aQVWBJ/3
	 +dKiBVfMXD3laI4YDbmtE8O40bJdY/gUILxxbubesEVHqj9Dr5HkyhjZzO0i5RIa/BRiJ
	 3YDz1Fzrm+IdHh8IG+UZrgNLRF1CB6RsVetQjzWR7blnXI01RkJgVov7Iiwh3lQl8Ls3I
	 xrIO768JsN+zglYxn+fAx8xLIc5IbZ9IRxbEmhUDaI8qelBmP7v8E/MWxSkdW62/Eng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1SCu11l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 96113606A33D;
	Tue, 24 Nov 2026 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1SCu11l
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 461791F000D2;
	Tue, 24 Nov 2026 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516540;
	bh=gcHnGr+EWKizS1GumnjfLSnWqHQiWDkKEJikRlAsFBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1SCu11lXCgrtQndFUuPQa4nAIzHdYxzjW3lJmjEapArRv7DjKd6q0cbjurhr6qqw
	 y16D76hCdK/a1p0UnCLyqJJde8yq6IfsH/Oz+hcOfCl3KfhD3Ng5fJb6pSrIGCUP+w
	 LJ0DdK4Cp8ovArbl8QLLOH8UE2zvoSalKn2VRdPg5nlwSl49m+AR86fpzsYaGXiujd
	 fg9kyFPvVx7uhqICg9POg/CoKuNr+GkAQa9HdsRLXzjP1DU/O/ETsz8VXE1U+jj9oD
	 ZtOMkA1fa0P3VQz1G+Z+047Kjc4lXFgEQSw35oh83KM1vy7mF5OcsDH2yZAFzlcSOZ
	 r+zdSoUFySF4w==
Date: Tue, 24 Nov 2026 11:35:32 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Message-ID: <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
 <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com>
 <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
 <20261123195935.1046144-1-lightofmysoul@gmail.com>
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
In-Reply-To: <20261123195935.1046144-1-lightofmysoul@gmail.com>

On Mon, Nov 23, 2026 at 07:59:34PM +0000, Stanislav Aleksandrov wrote:
> On Mon, Nov 23, 2026 at 05:16:55PM +0100, Bartosz Golaszewski wrote:
> > Can you verify the pdc map against the interrupt map? It looks incomplete to
> > me, there should be more wake GPIOs. Unless you have a reason to not
> > include all of them?
> 
> I do not have the interrupt map. The PDC map is from the pinctrl-anorak
> driver in Samsung's kernel source. There are 93 GPIOs with a wakeup
> enable bit, but its PDC map contains only 76.
> 
> I did a test: set an interrupt handler on every unused PDC pin on
> my headset and then I toggled each GPIO to see which pin fires.
> 
> 1. Out of existing 76 entries 42 PDC pins got triggered. 26 are used
>    by devices on the headset and 8 do not change their level,
>    so these 34 are not tested.
> 
> 2. 17 missing GPIOs: only 14 give a result:
> 
>      GPIO 42 -> PDC 105, 48 -> 87, 63 -> 122, 80 -> 42, 97 -> 96,
>      105 -> 55, 143 -> 72, 151 -> 118, 168 -> 94, 205 -> 130,
>      218 -> 124, 219 -> 68, 221 -> 133, 223 -> 134
> 
>    I am not sure about 151 and 168, their lines are not quiet on the
>    headset. GPIOs 114, 125 and 162 do not change their level.
> 
> I think it is not a good idea to add these pins without documentation.
> If someone can confirm these pins are correct then I will add them in
> the next version.
> 

Here, use this:

static const struct msm_gpio_wakeirq_map halliday_pdc_map[] = {
	{ 18, 99 },   { 31, 120 },  { 37, 101 },  { 40, 103 },  { 41, 104 },
	{ 42, 105 },  { 43, 106 },  { 44, 107 },  { 45, 92 },   { 46, 83 },
	{ 47, 86 },   { 48, 87 },   { 53, 111 },  { 57, 121 },  { 60, 56 },
	{ 61, 108 },  { 62, 109 },  { 63, 122 },  { 66, 110 },  { 68, 57 },
	{ 72, 112 },  { 74, 43 },   { 78, 114 },  { 80, 42 },   { 84, 67 },
	{ 86, 66 },   { 87, 100 },  { 91, 102 },  { 94, 93 },   { 97, 96 },
	{ 98, 123 },  { 100, 44 },  { 101, 97 },  { 103, 75 },  { 104, 52 },
	{ 105, 55 },  { 106, 48 },  { 110, 53 },  { 111, 76 },  { 112, 49 },
	{ 113, 50 },  { 114, 51 },  { 115, 54 },  { 118, 58 },  { 119, 77 },
	{ 122, 62 },  { 123, 63 },  { 125, 59 },  { 129, 61 },  { 133, 65 },
	{ 137, 69 },  { 139, 70 },  { 142, 71 },  { 143, 72 },  { 145, 74 },
	{ 146, 45 },  { 147, 78 },  { 148, 60 },  { 150, 119 }, { 151, 118 },
	{ 152, 85 },  { 153, 79 },  { 154, 80 },  { 155, 81 },  { 157, 84 },
	{ 162, 64 },  { 163, 88 },  { 164, 89 },  { 165, 73 },  { 166, 90 },
	{ 167, 91 },  { 168, 94 },  { 169, 82 },  { 170, 95 },  { 171, 98 },
	{ 172, 47 },  { 175, 46 },  { 186, 129 }, { 189, 131 }, { 194, 116 },
	{ 196, 117 }, { 199, 113 }, { 201, 128 }, { 205, 130 }, { 207, 115 },
	{ 208, 132 }, { 210, 135 }, { 212, 136 }, { 215, 137 }, { 218, 124 },
	{ 219, 68 },  { 221, 133 }, { 223, 134 },
};


> > There's no egpio function. I assume you copied it from sm8550 but I
> > think you should do something similar to commit a326b0523fc1 ("pinctrl:
> > qcom: sa8775p: Enable egpio function") here.
> 
> I'll add this in v3. EGPIO_PRESENT is set on GPIOs 185 to 223.
>

Thanks,
Bartosz
