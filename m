Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD13AF677
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552239; cv=none; b=loP08tI0r9AnStXw348rXfjeNwTQTe/NfjAGtGYTOpaFwEP8V39sQ5tlhePtPHUUP90YkqxVVXd9uueogPPf483cYSUP3TvlNCYPQxCyGN238Et0aYaqoYDWi9CRtukvT2a4N5meYcuwsw3WTgFOy31fMP6c63kpl5j4Ev6PL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552239; c=relaxed/simple;
	bh=RDoVcNfYx4gWnIuXkIiuuDySeKt6FSVcYGy5RTL4yVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foRm3EqJl6KCkUlAFKwN4UPFZnx9b/A9GN2phk3ns45ZYQcmOdL8h8Zc2LP7KJwxKMJx/cE7L47dRHuRepDaApiOySvbRAA6oaGwTJGyRTw/6XkM/GOTE5J1joI6cqi5pn5KrjUIfV1OM4Zi711+rs6XhJUuKBpbP5iEt8fw+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAodCrab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eETHPE9+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAodCrab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eETHPE9+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKZ8X1568466
	for <linux-gpio@vger.kernel.org>; Fri, 9 Oct 2026 13:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pTb/nAfNcf8kmDxbDKy+Ovtj
	nlCj5G5u+5gd5OlFFHo=; b=ZAodCrabe3fUrhjjoTHdRkIIE87+b2J+h/B6Geh1
	tmMSwvyuWk/IZnKg80VRBHtUP0RGB5IICsSGqhbUNxZCg3meVXqjUv/vyzAuSfen
	qRIwkQLhnCEbkulp70eSu36zEg4UXkthNNn+1HQHbRZirJuWG9zEDQYmXi05uZRW
	yp9125PWxK8dR5KwYaAXqCcdhXaTtZvBipdEdYsaXUNWa6tWu8Vd7b7u/hRS+/iC
	feKdKji/X+1y8JP2m4ZCPQyumYSvSbQYn+I5Pd7M3hPWX8/cQYUplxrgkj1hic1C
	K4lmOk2/oxUB59s7Z+iU/BH4MtqZwZW8eae8MNXySAwVSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmquws1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 13:23:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbacbb996so1047148985a.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791552235; x=1792157035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTb/nAfNcf8kmDxbDKy+OvtjnlCj5G5u+5gd5OlFFHo=;
        b=eETHPE9+KcDGZ9EcdZ/Qc96attPkXkTbBoFbP0QaFmiVJHyG4JR8rJwLKSPuMEkutP
         KKWch9uMC2JOOUejPmG/9wra9d9cD7euLB/sVEqMknCE+EMQniPb41dWNy7BTm3ts9Tm
         u4ad1Vvx5qyB4RhPVaLBZdo5GFe0vWHbKDcMo6hQqlyZ5qg/XQX46MKF56nr+5GeoG3z
         rmKzAPnRHaBV8pHQMwjCBgxZQXELYzvl6NjW/6EJxxL0+jiIrod00poKNJ8pFzroBH7J
         26QOj6wlYjviG95fjeWdlXnUpn1dF1dJr+PkHqoiy8ZaMpgXPThSIrX3B6v/XD2FZxbm
         6qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552235; x=1792157035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTb/nAfNcf8kmDxbDKy+OvtjnlCj5G5u+5gd5OlFFHo=;
        b=Z+qWcmfQfh2lzdCxlUAV2reAuG6VvVbEmu+PKVzCNmfvVSw2V/zp+WwIFpKaRYSjx3
         7ERNKen/t2OpLjtMk3x6flL3KwE4l1R4ncmuDorq3DqtfYhrIGcs0HCNA97Iyg+mwpYI
         D9FOh4sW6HaleO/TLXS9IcjgHcMqFpVhg5mMnrrwvQTwdkBwGa6ICOGivyWwCltKTM5U
         dYJEgkCVj1pj1IE02UchhN2LkbYyrL1VB3CG/dDDQv8gN1JyRLQUhI3n/PKla+loSjCd
         MTMu8L85Qo6yXZal4kCIuMEQJBYMa3eDuAd14eGAcdXrEDeMWxhQZHenzpEUQg+/fJV0
         thww==
X-Forwarded-Encrypted: i=1; AKwUvBwV3pwJRiv4JWFwGbK6g+vo5zgKe0IZtZHV4CIH52o6KoqUc9nO8RycGaZF1J5nXP6bA+P1hljlfnUN@vger.kernel.org
X-Gm-Message-State: AFuF++mAe3QlzpGnC/kfbi+PEZDXaRA+ZbLxqnOrhklKh/A5JrlYE0dB
	YBhrVKItqJE5wid7vRA7f4NVTujDkmihoFVM7tVNGGEKNuwMneOmjZzmI/x3jEBULvUIzco16CC
	LdVLBhdmCPJ4nwCWjbnqMAtsnYd4BYD60Yn4JEWAvzXWA0L8z3X1zupGvHv1yWNpK
X-Gm-Gg: AYBFou1gZLZXTCSuDgdL6HYTn2IhfJhqCTRJBkOPuQes94JPjGL+rsx+gZXqoPIBiPV
	VraJ1Z44sr/wX/8K7uoNUCgPk0ewXeksWcWhEmeTuUaV/VzfiTf/LitthVuayPNWV4XynrprUSk
	JZnbyJjcNngF7XNklQT0TiKGHVyXiCsHoIdd8r3+h/AXO77m/Pt+gcobOX/tVW17aAxfQ1Uwiu/
	qTY1lmeW/6o+grlT0kBiy6eF18D7qZYFefK/NflzOd4ak0qK54eYUNiJTOEjaQ0Ow4XF/0gM23n
	txaOsiN7LGJCAkmAHb3zMqj2BtwWPr3nB8+s41Ya1X4G7R6hU9ojqtoe3QF0z3vkcldytdSqSuX
	ct0HkYIu4whF45e1w3bYrMasydT9d2e/mefz/W6NvWVc8OOVlWZzDGut2hOeUZLkUUAUuUoqyu5
	QO1CRLgVzDC03T
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr253001385a.57.1791552235234;
        Fri, 09 Oct 2026 06:23:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr252993785a.57.1791552234456;
        Fri, 09 Oct 2026 06:23:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81e6sm634124e87.46.2026.10.09.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:23:44 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:23:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom: document Radxa Dragon Q8B
Message-ID: <kzqftw7lugumzzkafcnsa36n6nix3kmwee66bzlv67aoqrkovc@7lbdhwfchvp3>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-3-eda11e5dea8b@radxa.com>
 <cd97e6ab-eac0-4482-8b85-455ac8730241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd97e6ab-eac0-4482-8b85-455ac8730241@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfX0nWTQPIYWki1
 Eny5729HfHjmPeMneUIhK8I2CeKlWqYA5pfKwmGvt3oNPgwtE86bbOJ3mSxG7J9Z5wbIL/e6HKX
 xAEo0lnmMNOyylcoSUGI30b7/yfqCgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MyBTYWx0ZWRfX4+U9flgVuaTj
 Dk3SP3MIva1xqvUYxrNdSGia1KVbYYjoDWXpsqUlBmYRwYhDEDvpcOrOtCWRmWQgb+nbxlUWSsC
 cS5B02JaKi0Q7QOfPAOhgyEY+JoZ1gh1JSLr/OPOOgrQSli1Ds8TWiqTyopWZQPFqDv0p6+jdna
 Te/QCiDMUoEdMHpvKmj9mYfnAG0waCD0WsuCst05mxQhZYKGYHZfjhttHA5MCMZa92aClad/F+X
 znyOulciUYQnHfwB7But/4AYPtFamJrVnk0CdEoY+69qD71rf+1nxzq5o+VH1GNvmbduKWggSW7
 AwAuEuNICu+3vTnyhL/M/MMyF6f2WRwHQXprfb1/RIdUOTkUDwRTaiATc34/ZVsVuQwnG0A09je
 8fAaQWvhN0hl2ZWrQ68qf2qCFS0S9wYvoIgHAt3o+oGfjS3SUW+BbBYU50OylGM8+2XPYss05dy
 f9bM9ZWpT/lVKg2crQA==
X-Proofpoint-GUID: rZJqRk-lVspLA4ePeefzHCF6EAXFUHWe
X-Proofpoint-ORIG-GUID: rZJqRk-lVspLA4ePeefzHCF6EAXFUHWe
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8eaec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=CDNH-pee2JQSj4idvpEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090053

On Fri, Oct 09, 2026 at 01:42:11PM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2026 09:55, Xilin Wu wrote:
> > The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> > SC8280XP platform.
> > 
> > Document its radxa,dragon-q8b compatible.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Tested-by: Daniele Briguglio <hello@superkali.me>
> 
> Fake test, drop tag.
> 
> Why is this so problem to provide the tag ONLY to the patches which were
>  actually tested?

Please teach b4 to skip to skip Tested-by on dt-bindings patches (or to
have a flag / config to achieve that). This would solve 80% of these
issues.

-- 
With best wishes
Dmitry
