Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603825;
	b=cGnYt9Yx/CcE7uTZuLCKohhvng/VHx0e1yRYXpzxORtWGsoehwDRW7R2zQbGF00SJ4A4
	 8s68e5K5jkj+JBmKUQARUiS9DM/h0t6rpNz4aGVojmjkfW5O5S6CjassP6hbgD1Snffdp
	 mELMxVj8Q8GhN0A2Is/RcxfmRb4lmoL9YA4SVopaMTTRQSEzl4Yf7INXHxF9QXSMWK3Xu
	 weI2ma/amTphjOokoW24jFQY16BcBmfXC9HuJm2RwSaxcw/HKcX51updWNVH96XUKwNFl
	 AykaSNu62K0csf7+2/uKs0iIx5ZhhZAWWHrB72wJig3+1Hm8Bh958mmveOLKwR5IKyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
	b=m3iGcKrQ7m8ZaHZ0ZyTxwwCWcW+NlH85ZDCWiYJa4BeMl2fynC4FaGF0wFg+lpCEgCTc
	 9nR6b0ll/gy9RdBJDchFU6xPq+5SSJ3LNKGISp6ByI1T7NlA+Xvl/D36tNXToxzPX9wLf
	 k5xyq5PJ1xlp7RsmbwyZZLIceT5MZLGKfI7f+bbh+TjROcMueNdDHTRjBnGoVlTg86wTm
	 QixTT8tlFeMeNCPHOUaBuPkiObdxza/Kvf4BNM6OXlcqOYQZHQ7ntrptOnbjG6/NjRz5R
	 TD4zAVytGPam5UT3nVW18afHSFuv9ff0DAj3Rm09Wcma9SmwWS0jCxwA81PwYiZahMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JrO+Ag/O";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No32w+1B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB93E606A323
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB93E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JrO+Ag/O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No32w+1B
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlvV3642767
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=; b=JrO+Ag/OwSy7VidX
	92Pk4rprgiR9E8qwi+KeYpVD+V4uTVrN9JteEFpLlUJbIat7Wd3eoTLIAmw4JVix
	DubIzrPjol3HAfgk7h+sKhDxcBu5mypa9OFUlo5AYWlyarSFNoluaV1RiG077jLm
	OBMbPWNaX+43TZaO9/UVaoEZvPTmv5Yu0JpP2AcXS+UDXJ4DJQ+JzMs8wu5z6K14
	czJRIVbjuyrq+9fsGnkiYBIYyrNTyDlP7V0wbogYCUVWLcsugNM962kXIskUf0nM
	5Vx+4tRG5VMjAisEDL4kOP4X3cJ/cAsyPs1rbXBQxV5fYK+/OzrZb567zVW75wKQ
	bYUPFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aeu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so18123791cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603823; x=1796208623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
        b=No32w+1BZ/2eMSNU4GWE6SIzQ8cYHLHMZQu8Tswu73OMyttjwxMgtsJ84NCPQaMwqY
         ZseaKziSd995RB6KsFkqH/rqovbTJhr0W5Xpoj5EGuYNqWsLg+6pmeZY/e9Jcl3WJoF8
         DS8d3CzrM8xEX0dwr8tBCbQp3eh3iRdTB3GajR9q5AAJqwMxIjE0pPIlwv8Yqm9aupbH
         PesA1wRHghAD2PzMJH/rJ9UnxeJhWSgeYTMfbGluxly5gRix9JTXEUEsJj+hlrfJz329
         /65k0LODrnu1G7AGy4qbLIkE1vVuhEtOD8nCY0j2Ydn3VmREK/MYrH9eYkKaa50LerIP
         /Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603823; x=1796208623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CotQcIG1WKYFVOKdjhkmak6hbx+ETawh/eMnJKZBCkI=;
        b=1lMNkdjvK8cPPXOWw5P1uksFLCS309PfnA9RF3Ile8oMH+UhLlnm5IrunvhEkDPYXQ
         VdFh72goFQnXx4iByoNqbsrXLtKX3Otc69f5OOlDM5HCLfSdF+65RtFy4dGDSXV0yImj
         hHyib2yTtqI/cmHQMz41BPP+09aySawRGFj3FNdbSyOVfNppu4nrbOrhasPwbSUvYC3X
         Cg2ThgaJGxY0Bv5w1OEwzftcuWcUniZiuexg5kahTjYMjiiBIxDGmmHuNMS0kgOUs0Zu
         1jqIPP0iKf/gNjxcJ6Ee+LqaNMbvU2hknYlBNjAA5NKLhQYhaaXVHrWAi+MlKSaWEu6k
         O/9w==
X-Forwarded-Encrypted: i=1; AL+hErEnUYgRBSxtzUNlMkZr0FU0LrKuvU9Zdf+UVWuncyq7+yRGWZxke0IC70cAX7LemoflH7wzf6wbtCHM@vger.kernel.org
X-Gm-Message-State: APuU4Z+1Pnv3gBBXOX/w1OhiVZ6idINeNrzggakqxryd0Cxx/pCE9bW+
	kRJCXhRKvMEFFWKSxBZTzQX8tng3OEsU3q4IjzIrajmDFc9UtQPk7d+o7Rzg0kPMOjM6jklNXoz
	2AcZ/BSPKHFKeY3ULN78AUy76BRlEmtokEQZoONY68SXcZBtAousLIzHdcCjaNFcH
X-Gm-Gg: AZFdTZckYP162gNsO4L0MAtE9Ycqab2WXohKwNuIShbAbEPA7YodE5cyQXWtdOSXpyL
	SmdxtUkM2KsPhQJOKKegi7+ASNccgXchSlRwo3auOB6F0nNkUfe/CqUt9oIXLxeBE9ON0av4Pzl
	mdpivbrSGiKZ2Kr2hsxRkrb3UK4VpbsjN6R9UeobmEIr7TFYTib3JmKz9mw0kniBEufJXCbc7B5
	Eq2leVCAPYBkyVDbog58w/1qjXIBpOvMhSTqMQUZVTvUc91asYazOzWr5UwsmbL+Nq9aAVZ4VjA
	evdbXFPMuRmDVzfOCi5ksRvHjojAOlZ7NStGSA/N8OvKVmcO8Ya0npN2r59N03tBp0Q0dIG4AKk
	ZXQkyVsM6w22uQqAA3meuTIYhktgx0f2kkVfh0/lf16kafRF34d8vbjJHlnskSiRuwou4PGs=
X-Received: by 2002:a05:622a:e2d3:10b0:538:40e2:ba55 with SMTP id d75a77b69052e-55d767ae0f0mr292211361cf.0.1795603823187;
        Wed, 25 Nov 2026 02:50:23 -0800 (PST)
X-Received: by 2002:a05:622a:e2d3:10b0:538:40e2:ba55 with SMTP id d75a77b69052e-55d767ae0f0mr292210931cf.0.1795603822710;
        Wed, 25 Nov 2026 02:50:22 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:22 -0800 (PST)
Message-ID: <f4b01bab-8ae2-484e-90aa-915ce5a984ba@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:19 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-3-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-3-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06bd6f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DDIdZFHhyExMSTX-0roA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: cDYuVXEkdOMVtEKsiwwZVXFjp61CecR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXz9zaKg4ls+oW
 Gv0yT+i6VPJOJxYhr0yEtvYNcZxqQ/oaHZTv3xEEWkZ20FsrgnuZXLV9heacBkFxSXfTpYjEDVM
 qyGgJ8712o7pfu57ie7AP3+3r5G5fFW+tDvtn+TZwd4jdd7YMcbO8mStOzSh/7KyuZTaHG0EFnW
 TGqf0DayDEeThk8EuBxQMqE3V2P7HDYnRWYEncyhNWRNY0R1FxfLAV7j2ML44Hz8UJgeJV2d898
 GxSepuNpagWeOys0Fe1hSHehkdezppA1+G3Kl6GUMiaFlJ15gpjRqcfrgg8YlerEWPoDdaQf0ie
 OVHYUUGrwkN/auSXpL/a+lcnywNUW9NNUCfS4Ma7ozoCyhjQEUjqWTenmsDdFLxhUNmhzWBG0hc
 MAQ+Lf3QGi2PEarX155SFA/Rca+cysRFt4degTBau0iWi6CY2T21/1dal0QHvO5yqQGKWo0w1rh
 0m3kw0GajqY/0wrjqaw==
X-Proofpoint-ORIG-GUID: cDYuVXEkdOMVtEKsiwwZVXFjp61CecR4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX2YXJ8MjGgeLL
 ycZAPjvKmv2/Lt8N22298Lru1pdOwD1YGrqIPJFwJGV3XqoZ4/3ld5R5kFS6aOmlDoxrRViAuRA
 BxCpskOtRYOS/qYZw/mLgYngQHZe+Dc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> Commit 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
> function as non-strict functions") converted the gpio function in the
> milos driver but missed egpio. With strict pinmux, a pin muxed to egpio
> cannot then be requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() for egpio as well.
> 
> Fixes: 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
