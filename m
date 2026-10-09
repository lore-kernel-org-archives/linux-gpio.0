Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476073264EA
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534189; cv=none; b=NfdVE+6zSvtNjoSFUZX+ZNU8MrYLZdX9BrCALl+fzJ9B411UuoJ3mmWqSyoCY2wSrK9inhRL2Y269bvL1MoMH2aBApu7jQQAI8Yp0Lb41hUuF/r+0M6Ve/q5V8Tm3EtfGMUaG5uqd+TElWEzflPdaAPNlgo+gKIze4vO0xEC+pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534189; c=relaxed/simple;
	bh=oKcONAB5sNh3frsP/GTImS4Z63f4ZuBvkhfNSfI+ziw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8Y9Tb/PwLArFMNEjkmoHz80lzXx4eZioRXN+PgGAcUBCCAs6cvQL9SwhyL7BF/bRcMuisPK4YG9av/tMgw4HF6T13tc/H1cz/WjOFSbywTJfQ9r9S1iu18QWmc+fjnd06WiYt+zkJCkJuFE9/Y5YzuCiN9l9Q86aWiElxylWYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qz91mjRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HorZuA+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qz91mjRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HorZuA+U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KG5l1625941
	for <linux-gpio@vger.kernel.org>; Fri, 9 Oct 2026 08:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iNcP9lIMFixukf9jSoJkK4cx
	lZP96poOCV/W1Al4rms=; b=Qz91mjRHyHCL8vofDqUgYO+5zTg3hjs5dCMg8J+f
	P6+a+7XbCDIIgLNkKRZgcg/VUykHcL6tlQqGSOTT0YqIy4FX8njnILTnBL5cPi1D
	E84JT1HgPDixSuu8MTRbyzHF0XxgvoyoLIUEFbdWz0MvHDDQr3obh0qjIu0VP52f
	oKc/FPHzliL7OWWg6m24r8io34ATeu8Hf/Ieexenph2oLROrTTdtNjdjqOx98rNE
	Hsl5yLT7Yjt7L/NL9WsiE4UpZwmJ/Ri4Jjjw9kzX143VyCGNhm2GeE+c11IPpu3a
	DsxdPIcCTqFRWD5/1cGPJJCCFCGghkZGlV6Ev5jlzNWBYA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj2mch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 08:23:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a7c17166so134151946d6.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534185; x=1792138985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iNcP9lIMFixukf9jSoJkK4cxlZP96poOCV/W1Al4rms=;
        b=HorZuA+Ud9ptDMAn1c4kgcfEuG/AzgxNsW2CG9IGvbw1pwlrBkmFZib3+BDLN5N20E
         odvs9J71YNRn/P7DIZcP5fXQ7YpLXZe9xR2/7eG5MS0oII1mSOEMzJD6dRHHGjhjQ0Q9
         jQZOMcqaaZItNAS/f+MpiffuTFQOyzPbTs/xa6CKmZsz3p3F9p5Uo2Szzp3r1UFRM5vC
         cd0I5j4eqjk/6WgG/U3q/bmwFtJeZsRqYYOVF3fK7B7XJoZCL2SKl4kB/GhRterz1K/e
         skTB7DJbZjUwX4wNOWQtPPgLonaMxeWu7reYT1Z/0C8nv0sqG26pukbhmquhgPhvnEXo
         CmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534185; x=1792138985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNcP9lIMFixukf9jSoJkK4cxlZP96poOCV/W1Al4rms=;
        b=k4v+TJFKkiLbuIwooHKQroLKgD4QzTmZ8MdTvKGLNVyAl4uiglZAChe9Y7dW9Hz7z6
         jpn6U63V3Dbg5iXoJmkRvg2z46FlAcNTz7Uvd5y4OGEzLfHP7lx/4nBfCYsigW5wbmEH
         c1GQJhlX51dus+XBAu75vvLrxOtKPvY6lPnYG+IyCnPEjCuXJL4EO0yK4srK0tW6fUSx
         19WdSn7Np3Av+OthFZcffTcloHodKZIsiIfnf5iFfwumYONhW77QSQuy5p8LVQqKOZ1z
         rUFGd4/h3u0RUXVDz90SHZUgMEqhUYrTIqn6dMuneANWETWmjpjJYwW7fqKblivkIs3X
         ZNZg==
X-Forwarded-Encrypted: i=1; AKwUvBxaiAF9scGQYHl8H9UeGY6H2AqGWng5/Ud+0AnzdD8yIDaLm5rm9WV6oD738vRfVcp3bmqKlj8r4osw@vger.kernel.org
X-Gm-Message-State: AFuF++moZx/AlBSSeuvyhZ0xR4Ou8MhhVlTz6Lx9K4lY2CRk+aA/DTb3
	dfHq+1SIv1+zdGw1sSK32mW8GToD9S65Rq13wLAumb8VGWLr/pc+XFJG7NbGtYT8zZAtz4vYEW9
	MUAwWEflmJC/Q0JRNnXojmdNS8ghcs3VXHKVGBOUETZgBz4CzTJr9z47kFjTjdt4R
X-Gm-Gg: AYBFou1dIstMtb6tO17hZ1fiW4rnb70+oJDyOCrF9zrIL52TCilc9XupKOJNFdWwIb1
	MKJ2UhCAD03EUdqC79J9TJermBtTmMf7mGb/rMIiS50MrFozMPicjQqQKyX1sO6umrYYxaJJ+mq
	m/dNAabNwvKtlzS21uxC7AmVfyqbPSSwurCj104Re7op6NtpCXc71UXYgLq9dpTwcfFccILrmoM
	SUH8yQcA5pjA7cS3VI0BVqj9fMetWhZnb6LjYwmQB7oaic9oz4xIkx7KvO/SmrT3AGhIWMqtaVd
	qT7w83/MfMsksRd4zykbRjvQDrEWiPaID3gjw5i4dQpEoGeImj7dhC3tZUhF6iQ57Z0Fq5LXii/
	T2JXlt865v0zzI3TG7a0=
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr153056785a.42.1791534185568;
        Fri, 09 Oct 2026 01:23:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr153053585a.42.1791534185087;
        Fri, 09 Oct 2026 01:23:05 -0700 (PDT)
Received: from umbar.lan ([2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd783csm4527711fa.32.2026.10.09.01.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:23:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:23:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, Stephen Chen <stephen@radxa.com>,
        Junhao Xie <bigfoot@radxa.com>, dragon@radxa.com,
        Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH v2 2/4] drm/bridge: simple: add Chrontel CH7218A
Message-ID: <p34hqt4x5pthm5ailvwvde4le3ubhcsxsiixi4y4f3ma2qehrr@54mthvv3carp>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8a46a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=6mBZQueXRAtxK1RCuRwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: tKDYtolpCdSoHgt7Cqb0kBNehZoq1ToG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX/r2fI17iNR2u
 6GadlYSaDPH5lVevrXKMU86Lhm1Qm17Iq26t6xdrvjf1SengcaryW+1JUCEUxpAu91ThAzzJKKL
 5umm3Q60FVs1jdg5C8Jg4B6Sqmhzo895FKdOuSJb7T8+SdwMluOdwQT4UC4s7gEkhlpmfy4lnFS
 MdThixICB+GeN/6jJT/MuCsUiytBNJaCyaEYp1uBG8LgNJgJJD1embzw8O/SLRXPmmNq0RmN6na
 xJk++yp/zi6Eh/f6Z86NDSdBsCxdoZwO4jT3kN1kVNF8FKvZIqdcFPENTXgXjDMAkFL3TaP+vCd
 Qgq4IlzKTFSbcQXOiiZAfEGIiEldPU6O3hu7Kdi6aTVh0I3sZUs+izob8j5jZcM8h+bIDNbAnKB
 hViJUWvKITr0l8UZ6oLXLxV3eJsSN8D797bFSDFF+Dhub+dKP67qvaNYMkfoH8jpricUF1dwyh2
 DBtqiP7rObXnxqpqxSw==
X-Proofpoint-GUID: tKDYtolpCdSoHgt7Cqb0kBNehZoq1ToG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX4rKAG9r32mYq
 oDi54Z10zqGtmwQMx0Eghj/ePPUDk4t/tBzMwfzY+yUuKemAAgrbge7xj1j+YpPAReAdDfZ8Q8f
 RKIuyR9wZB2fMZFk+zZe7bhctMO46L8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

On Fri, Oct 09, 2026 at 03:55:07PM +0800, Xilin Wu wrote:
> The Chrontel CH7218A automatically boots its embedded firmware and
> operates without host-side configuration.
> 
> Add the CH7218A to the simple bridge driver and expose its output as an
> HDMI Type-A connector.
> 
> Tested-by: Daniele Briguglio <hello@superkali.me>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
