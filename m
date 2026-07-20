Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1B13D0907
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543658; cv=none; b=hAaEFM3XUQ9qYo60ctcJCP72DhfOcwIVQsYfsniCLIxUwHYUJ0T22eBkGgyKHl50TtS44HTtvYtsyQE2quXefs6QwQoPYCMYXgPISpuYQAohExvwaUEAxGwIt0Ip08qddFpYvHYoz2bqLP+thVR06dkw/nHAQkueB79FhTPLVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543658; c=relaxed/simple;
	bh=nfb9wr1IkGcOE/xOB087/ooy5UHg3twujjs8ono0J50=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eWridvEZFmYDDF1wnVY03f5EP+eQo/64oWtH1clHuaXdH8Gw4Wde3KdYURXpdg/YnnJvSmyiKmiXM0+LyWLWb+Pt8+LuftUZT/DNClhW36kN+tTMgXYLc8yTPFA1veI0VotXUO2BSxFXXEjYHQuDmd1dy25FN5exG35PkVyWszs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwhQA1Ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNRIc87N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwhQA1Ms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNRIc87N"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vhph2045743
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 10:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHewdeqeVNcntSNtq50xsoiwCnZXmMXQMckL5dStHcY=; b=hwhQA1MsitD5btdd
	JqsR13zTYhd8UuvDpj3UXwKAUPj0TaA5iOiiU4fX3Dl0h9mYVWFrxWQnM99+iJ4g
	ANjDaLE4FRRQuJu80TqDoXekVCzaxkVLwtmfcI6PJATKmGrTqGCbOwiZ6OYuFEI8
	jOh4DmrE1VTsI8P1lcjSb7gPcsmo/WiWwBtB1y7hkqOgW7fehnlM2UbgKLWXfV/O
	0zqdnt3bPWdecuslW7LhPv33ZFqcWXsEp5FqPXPeNcHWCq9XKRAlNqK/qi2+P7In
	a+NLjlbpaVpOdDkCchhe5vLBtRiXesNklo53o2kwUF+jj/a2DAXWu6+yKeS9pNvl
	II1jsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg8hx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 10:34:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so165798631cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784543655; x=1785148455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHewdeqeVNcntSNtq50xsoiwCnZXmMXQMckL5dStHcY=;
        b=BNRIc87NYMxJVo/m9e2bflvbdwGq5m7I/r0D+AwC4b+bvVgkr0zqYHnvpWqSvwymyA
         +hPIibLtNvYri2ep0vqgfboYTsh4nftHSoiKS7XMmH3g6KOykEPKcYK5Jkn5wZhObRuN
         wv3qls1Nn9GpF7S2qLaJhIr6rf/SkMcIMFPFc9Rjyn1FHmqlunqG72nhO0+IP4qnges6
         NguYYljeJ3hQBwlenGiR5Itz+nbuRVrYU9ZgPreE6l4EIEIDFDKYfoKDXAzjDS8bHhvH
         YFXgZWE157a//uWG8wSSp3ivpovLfVc9w7slG8vthSuiBeYj43MQXF/1LPlo/PoUcCjx
         OOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543655; x=1785148455;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHewdeqeVNcntSNtq50xsoiwCnZXmMXQMckL5dStHcY=;
        b=pQJRkcA6UJiqg6qHg6F+ENF8QetzHD2tr6Mp+/ePWFiQJE3r+DCBYxH4rh0TjPJkkP
         iujVY8Ue6U4BeERyPR8VBDzFI2pqMO6FqdUo2oslK/XLU7+8fHZFWRxGtotwe8LCvqny
         SQmSqCs0p930glXBOvFXf/XlAUBALX9TsiZSG7L88qBLtMNUVIxWePAhxXY6PoB+zDF8
         GNsXef+CM4PULhHeJqfyrelq23JElCnYtCFbtDUvpNHZuKCXg/g/WPWZLouvH1SXB9R2
         uLJNSyBOOlfyw9JIHfSWnZjEEFukMa0ZO7v8vkIEB17uxW7v5f6lsKel1OS95HRdVPd/
         a85g==
X-Forwarded-Encrypted: i=1; AHgh+RoesAMj/GHyeugW6zJNV2emk6fyM9nLYGSv7Ey3xKIWhSL2wtx0C0W8rM+FkC1nl03sevsU9K4YI2AO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy311X+osPFhDrVMOTnznsnlNmfavEDXvrbJs3cgWUpAL7UWVU1
	u354OpD7TnnItHPPWTn0TVI+Ofd1koNtdMm9RffxwKePDPb72wNfJDj6cRHw0EeIH9NM2lVkg0i
	6XfsytuLHUXVuGHbSyQCZ3grf3rp8EdrJr+8XoUTaO/n918mEO0K9g9PYqbls+TAF
X-Gm-Gg: AfdE7cki6UNb8VNRUnagNr8jm+IKOWRVkDqdz+/dXqOh7zalRTZ0CxL27CXDimjxUDX
	z8YrwzRaFcukCrJ1EDcrEyF5oif5u3DnpWpBoPauyYhqzk3xpF5FvCDrfNTFQo5lR/f/w9hbpUR
	2bwsDigCkLvb4QbPwuoszfXePPrsGOGcLUBNuTLDknxJoc6niX5wH4vZu7aGixIuljz0ZOW6YU1
	Y0mc82HjslELKk/p+0fNbdtAs6kXE5hr5BJD8nAg2vLCsUYm5GyyeXDpC4Svak5NYyX3ZBaLl9h
	UNU7FZyYGn+SdHvWX1/Ly9CdPLaj66HHcdgUOFGEGEHMOe2J0s5WcS0yqTUuo4V1rSCEDgOmKW6
	07mOQTLyMJ0P9wIzsIH2typ0R32YtK42XCyingUOLuvk1Jw9Sha22OVtqiHGGtreHmHJXLcftjF
	/SUJjR38QHPMf+6ba64Z6DwYcQZNsABwRfH1wUqnU84cXS6ivIhfN1UyYPNGbLk0QlZPo=
X-Received: by 2002:ac8:5d88:0:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-5213c8e3aa1mr118700731cf.8.1784543655061;
        Mon, 20 Jul 2026 03:34:15 -0700 (PDT)
X-Received: by 2002:ac8:5d88:0:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-5213c8e3aa1mr118700261cf.8.1784543654369;
        Mon, 20 Jul 2026 03:34:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adff3sm439489566b.2.2026.07.20.03.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:34:13 -0700 (PDT)
Message-ID: <8d86ca46-d329-4e65-a7bf-2b79fccddf05@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:34:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 8/8] media: ov2740: remove NULL reg_write callback
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
        Kalyani Akula <kalyani.akula@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joshua Kinard <linux@kumba.dev>,
        Antoniu Miclaus
 <antoniu.miclaus@analog.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Miguel Ojeda <ojeda@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>,
        Salah Triki <salah.triki@gmail.com>, Yury Norov <ynorov@nvidia.com>,
        David Carlier <devnexen@gmail.com>,
        Achim Gratz <Achim.Gratz@stromeko.de>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Patrick Wicki <patrick.wicki@siemens.com>,
        Markus Heidelberg <m.heidelberg@cab.de>,
        Markus Perkins <markus@notsyncing.net>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
        Chen Ni <nichen@iscas.ac.cn>, Kees Cook <kees@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-omap@vger.kernel.org, mfd@lists.linux.dev,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, rust-for-linux@vger.kernel.org
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <20260715175229.24672-9-linkmauve@linkmauve.fr>
 <al3sxMUgeK49dwNs@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <al3sxMUgeK49dwNs@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f7veKgu7QAbrqOGzYqcjP1YvryBBTkYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNyBTYWx0ZWRfXzPsoobQSWiGN
 +B0yTZGm6RDlnFWHSd2RNdboFA+RxyJc+zXrz6bAHHtnJJzshj4Wzhfn56zMh3Q1El+7xwdZyQT
 GkK+FknSMqgNOcrtH8zIclubpbnPUSKmRNZ4TXnlafgBOkRCJ6g40hc9aeVHSHeXNdwyR2OR7rx
 N4C4qokJrp2nLdg7e2N67k35LUirQ5iRGYpDf+IeMgwj+qQ7wTLY+a6KWP/Afa3XtaXdpbsqK2U
 /rps73HW9Js0hd6BXZhNl8OlC1Jz7nnOIeO/9qyXdHpU+m3OmGSV7JsmYojpAPPfOps+CTEeUFt
 s/bdOGHv0zgF4RYYdw7q/pFmA45qrEngYPBRuw4kJuMcX2stFymMGIZlBjj2s2LOyg+itGytDAE
 XNvYTwOcOcbpmY/egLM+UF0u5O4GV4zF4mjmmTukrQFtSibnbXMSUZlnTzsKYNYupKzUUyeUOSN
 fNM2KKLq/OlpycgB2TQ==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5df9a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=2y0c4oOAfBMx015UTLoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: f7veKgu7QAbrqOGzYqcjP1YvryBBTkYj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNyBTYWx0ZWRfX68NPCmip6ulc
 HzrP1E9+slNK9MRTddnZQuG6oMDbcve+kQru3X6Rw8jRJTC8N2mX5+AklvXzOWVnxtJ2o+PR4IM
 G0dVnoNliL0adfzQSPKJl4xXEEaeQDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200117

Hi Sakari,

On 20-Jul-26 11:39, Sakari Ailus wrote:
> Hi,
> 
> On Wed, Jul 15, 2026 at 07:52:24PM +0200, Link Mauve wrote:
>> This field is already initialized to NULL, so there is no reason to
>> write it again.
>>
>> This prevents it from appearing while grepping for reg_write in the
>> future.
>>
>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> 
> I believe we need a real name here.

We don't need a real name / official name here, just a "known identity",
IOW not "anonoymous1234" since Link has clearly is using Link Mauve as
their internet identity (given they went through the trouble of
registering it as a domain) I believe the S-o-b here is fine as is.

See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330
where the "real name" policy was weakened to "known identity".

Regards,

Hans



> 
>> ---
>>  drivers/media/i2c/ov2740.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index fb590dfadda1..799eca4023da 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -1271,7 +1271,6 @@ static int ov2740_register_nvmem(struct i2c_client *client,
>>  	nvmem_config.compat = true;
>>  	nvmem_config.base_dev = dev;
>>  	nvmem_config.reg_read = ov2740_nvmem_read;
>> -	nvmem_config.reg_write = NULL;
>>  	nvmem_config.priv = nvm;
>>  	nvmem_config.stride = 1;
>>  	nvmem_config.word_size = 1;
> 
> I think it'd be nicer to do the initialisation in variable declaration --
> all the information is available already there.
> 

