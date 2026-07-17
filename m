Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5923E3168
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278741; cv=none; b=tHYAlNQ84QXRdSZGsXF2VoOWPMnp7RUTpq1Y6d1K9gVjT10cvB2nOT8QkSdqyVL/kHmZI/YD/OpLeCvPtPI3m6FPUe+9GnZTMnxoHL+B2ikiALFzTQjehE2QzkpLMbpGhD5oyVCfBOREp7uJaRTQpczF81y2eebW6YGoxrFoGgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278741; c=relaxed/simple;
	bh=iKr+ORJN/0HmCwv5NrZPcwiCSwGwPmGXsiFEI46TzZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JvQYm1XGPhsfTY8gxjm5gGbzEuO/FNYQ8E/Kueb5oWSMDomOUJCwaWVUvyBnG6+Ude6S+UoqdH+mozqrmwjZSY/kkjJh7buKfwLqYBUW/kjhryLHZ7PnVLKOnffjNQL/JC3PNopuvFIw45dRITxsEZD3tzIp29oOg7dfcQmprLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l400jifc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEtOBm4/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l400jifc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEtOBm4/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRVh979781
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 08:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=; b=l400jifcL5aKd65B
	5LUw2Bc0DKEUaD+NP5xqtPA0B+pUH7FOZJXvTs+5QjLB6A5Gg8elI6ZNoyfPveE3
	c6jq6vIIbzxH9mI9jgJ3j0N+TLBSoEiiPaWzLOHUlLViZNgsZmc/WjtUN0Bh+1wD
	FBsECLyhP50+rHKfuAww3lq6pCtK3FMsoNMX/+5UPmIhIgCf+34zN7ItdPiQRVn1
	YuBZTVahOP5+znFPqWN37skx8eW25UhncLxEY5No6gd7D2EJk6mlPGaNSy+HmlSv
	7ZU/elCzCRgFqR2DaXZBaHSiUoaiCj/LdbpP9HjwCRdDBT6RXnsOPSUQ69WmcMTU
	YlF3BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grh8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 08:58:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1852a86fso93760411cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278737; x=1784883537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=SEtOBm4/hnGL9sPKUVw8C0KctLCeClf3lpLteGqHro9v66g5E1iMTGTUtCsLhd7CkW
         +zfzkIvZoEcyCrbM9DS1pYlO6Hgefh1W6d2i/jGJCMrB9Nf7lgNTZHyYjHFYX08wTddZ
         TQJeDpEqiXeYrW7NCye5DlcR/20LLkPZWGzzLuo6iX8BQN2OdkLbcyQUMXGzw3HDUGnn
         3WjdwvY4NZFfGquxQPlfympBgv6pg+1Hlh7et/F6YrAhQ0vOf+Xa1fkSNyzl0x+wan7C
         FLbGDPlNKiigxyk+Ug5HfN8hSwtYM4ighpwD+IXmBMRsxP924fCcPNb6kpISQQnQNVTW
         pp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278737; x=1784883537;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=qOaRFze1Whw/Yy1pQIv+L/OtxqXRg9i/LDBizjZjWvBuBto0T9g3sAYN7RRQ8VJ44q
         J730PHcVD8hvTQz2Jsd3JQNAXOl+LRp+hpIj5gVRO/9jjgg/CfCoyNMssTMZRpo9iWoj
         UaBsy8IkVhnmW4V+8HLcicsFSogYH0VNbkWtRBgvTeGQDD4OWI4ojz2fvr/r62lRAcYM
         +83AGT/rZsw1nz3dbochUB7haXAqdjFsqh5VS40KKVYokRUb70Jc4y4Nvj/u+iAXyTbf
         TSxZgBiCdJeTT2KdG+n4pV8aZMAUH33OxrFeEFjEcf0qi3vNbiO9kBhF5bafufPMQ4R2
         TJ8w==
X-Forwarded-Encrypted: i=1; AHgh+RpQMRi9S1MkJZX17s07+GoXqNWpUovpXhSs4qRRY6v793YvmXaNNTdGBwFT48BmIa+EA3hAsWHea3yw@vger.kernel.org
X-Gm-Message-State: AOJu0YzZXVDbps7+4mtNRVEng5TbV+jPZD95tU1mqaIbP3VuEs7UsHcb
	8CT4QW9WckyobXy6Oa6X3yBU5B1rE+P7G9zzCZMfeT3OpV73Xak7Cs0+/tH8Qrp4KXIHHxt7sIB
	WvQAucEcNEUkC8ugJyvwYXeVRm8P30sCmuq3dZfvbImMzrfpiS0VGd5RNXwEMaWR5
X-Gm-Gg: AfdE7ckxVByGXGeTgqtkXS3PH/Tv4RMQounkRofrVvgHsqL1TwE4eah+jQ+VEip9iIN
	jIH+Qx/41M1UZBd7zB1d0a5S3zKEbzFMnp9iOJ0wg+nSDGBvxub9lnIkeG8lfl23TfQefUGSeYt
	mfX0ibzPX9JFY3J30frirTXqwIf1vgvgiUhl2joeyH0yPKjrZjfjsAk69cWykgHF30BvwVreMXn
	zLZ8kAMFXcFK6yLM07NUo0AACXABVWBurPpzK4mOBaTqEbxw+ZV5IrjVODiIwkncaMyvV5CwNs4
	qcFma0mjG3UDRtg00xZfTdNJy1ZXHIm0r1KfuFVtCZ2kLzBHHtvdYAbdw8Yo3Fl/2LFj0LJyB0L
	QM03vZZxvtF+36KIydqzoS0meCJTg
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604711cf.66.1784278737601;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604541cf.66.1784278737262;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e65644sm1911449f8f.16.2026.07.17.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>,
        Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Swark Yang <syang@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/8] arm64: Add Axiado AX3005 SoC and EVK support
Date: Fri, 17 Jul 2026 10:58:47 +0200
Message-ID: <178427872043.9452.9219608850005529427.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfXzM3tn7IWXpFq
 9G7VIvk8+TaATStJJfOjqjqkr0b01hB1PvkohyBFCcQiCJFdgIn/hSAlSVzHjg8fSK/nEYOtjO+
 oU6CFedTpWLHky5SBjZvRj6dOlMPurg=
X-Proofpoint-ORIG-GUID: ZuvHTPnIbDjWNRzKxwxcUCgSQwIYuxCD
X-Proofpoint-GUID: ZuvHTPnIbDjWNRzKxwxcUCgSQwIYuxCD
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59eed2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zGYnv34WkyyXCUjmJXsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfXwaDROKdAo94h
 U66qZU5CK/oraCdjugpT3LnpUJXz95ulhl4oX3Y/N4GcEed12dS6U7/7nZVGqDvuFOnf9jnDzUL
 V5XWCKpiKFhSduYNnBDpmc2OUHmqW8Bmfag/DVffEUsTznTTYEIf3qfb/IwmA+AdimG7B2rOq4q
 9e+PKGp33yEWNLn7j7iyytoM/IMkT1t/FCHRApA+ZZ8LRTeUxV/dlOL+CWKWyN77O/+iDmH99jZ
 RqGr6vY6F7QWkyqd5jbBNR1T6DZt+f/h2DhR6HURQ6dCy4K3tQ989DodeXuO2t5SAXxBowAkxIO
 gBFTBx2ckGr7ycesqkenaSOLDilOOPgyTZrDaB9Qs6Txn43WBFSidZLQ4DvZycxgZYwEVozvXmn
 0CvaNuyJ6LN/36PYchU0z0QWPbqpcFquJUYfucawIq734b43rrJK0H9QEDvYTwqdp0svVF7tmrh
 2vmYYsrFAcLaiCdeArg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170089


On Thu, 16 Jul 2026 20:51:07 -0700, Swark Yang wrote:
> This series adds initial device tree support for the Axiado AX3005 SoC
> and its evaluation board (EVK).
> 
> The AX3005 uses Cadence-derived UART/I2C/I3C/GPIO and Synopsys
> DesignWare SPI IP blocks. These are already described by
> existing bindings, so the device tree reuses the "axiado,ax3000-*",
> "cdns,*" and "snps,*" compatible strings; only a new SoC/board
> level compatible is added.
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant
      https://git.kernel.org/brgl/c/e8a40b3566887c1c83d4cb87058d4e98ec8b4a14

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
