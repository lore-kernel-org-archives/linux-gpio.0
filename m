Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702141;
	b=YAICfbBps8sSTt1YMrp06qYviZjne7XWWtH93nckIAo1gN56BmuK+tkpWRdg7hFRt6hU
	 NnpVSdHYaDf7bGoxIp6IxZBBAn3+O4R1K7dwIWAHG/iSk1aCuYGK6tNZKNAqLMtp1j621
	 ZijxZwOsmGFfxtPQa10CyMf08JruJqhwk5ziUo34CpD2gDzW7G1sNdtUtKgHIgGVwA7mG
	 +4wKDTNO0rEmwDunadLUVFFRmYyUekeCPMbatn7TuiFb3s90L6aYHIYD6A6fo71Qo60ls
	 rEF9Bdpybl2gIjRK8MKYzb0HX7so/w7alWSpYvS85MstolSILT7xjYmEYa41k1fhUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+RnIM1HtBqJmr1TYefSFaUGmNdXmFqkNW1kZ1ss1nFA=;
	b=rH2V70f6PBYgCxewahCtvppUCpNBtlLqUEa78n4hiTLSH2aqlLRMDco2JhmOMyc3pyr/
	 yymGhQlKhLXsx4bhNRRp/pURtKMDmYWS/r62VIPUY66q6ZBME35MHKXC8VFdw2a96kE8b
	 Soph3b8+E5BbZZs0THz5Zdo4ppEfI9hYNISOxklWoFyyrrWCHqLmEG0qMEcaTbtAsPOvW
	 JLj8lEdIx5y6Ey4b0N9zlGBXvKcJBYO2QNzHKEPr0fLlAm7/3SG/8uNe/ykZMlE9sFmIQ
	 R+3mhu8PNx7haouclvv3vvgaPlpk6YEjc+mbgCOXhcGE4eV69XSGiem8sTWBJDYcuKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW43wOmH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KIdY7ypv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF5606A326
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFF5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW43wOmH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KIdY7ypv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVNil3893643
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RnIM1HtBqJmr1TYefSFaUGmNdXmFqkNW1kZ1ss1nFA=; b=lW43wOmHoNPpHkvT
	9ddEi4N2W/l6Cv18M1Won6TjJfjMXKA4KAvrEbtaM9l+Aaqhp886oj0JL/RaYOTI
	LbyetkOg+lFv+f20Behr3HyGcTaL/JSW1yFbeMMTv3a6+grTCWp1pom2c4jMRTt3
	YTevRga6DQgLa2mKWV9uYGqPljyoPnBETEEJCX4cWGQmAEDgLg85SHJ2O310yI6V
	3Ttx/fzhbN4db44RghiiUdYgm/mwYcHFuUmKOG2JVLKhKppFSluIAM8+Wx9+V9D6
	8tidhypqnS1DUVaOtuiuxQSh1r5JJbF06C4wzZrvwvBuKX3UpaFcSLwLdBjvRkZ4
	rt6qqg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm814f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:08:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so4783386e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702139; x=1796306939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+RnIM1HtBqJmr1TYefSFaUGmNdXmFqkNW1kZ1ss1nFA=;
        b=KIdY7ypvzWNEJpPE1zjY9JwVUwkmPl3FwlH/V6mvBiFQGbQGytZA4XjCofszz9wY/g
         tQKbwYbzuwkBZbfp/N8vuE+yMsjPHkkyb7pEmP5fbzZak+YnBThwUCVHTj0OGf5GkoWl
         mRN3W1Jsts4urfNJJHajr4zP6qisVOh0z/NwhOrB6xmi7GHLhXh2sc9HjIYllevJWhlY
         6ZCtepY22C7VosJU7pQP2GGyrAxmLI5J5HH++d5DXO4e+fQ02q+XBpL4SPdVFgq4jqk3
         WB/TnPJBcvbIWwZ3LcjedjayFEyid+sy09Xc7PoWF2yKJffvz4xLQktUnWe4wXJQbj2W
         GidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702139; x=1796306939;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RnIM1HtBqJmr1TYefSFaUGmNdXmFqkNW1kZ1ss1nFA=;
        b=21MqUmxhDLfiHnBWpjNP7nn1c3WhN4lPIuiVz6IJBzynPr1O9/y7R4a7JYpo5+MYuE
         02Us5UFMsVV18qAj3cPji2fkMIonz+YUbaDNvuMQAZaBft+u8q42RLRoQENj219e+tZz
         UEjheF7gPk6vKh2pyAa52xbgzJHBRdwUhOUgxRir0NMOm1Lxl7mvyq+S2urb2L8NzvP2
         XYg+yALy/G4s83YAPr5s89jdPox/9nCAn1ESP+r2Klx3gz7q0d5DeUnrzrQEEMds+Gpq
         RQSRSN86RP8sJqq6QSJUvEekSGye4PKLiNMhHt+15Uf2ocHxjis4hT1EE5GYJXiCJZMe
         h1sg==
X-Forwarded-Encrypted: i=1; AL+hErGHFaj8iXTkinlxQYbVZZZ8vq1/B7uaHP2epFZThVYTBUuRH0yQfBxzo4BOxbHvNhN+5uXhc6O+w42O@vger.kernel.org
X-Gm-Message-State: APuU4Z/xbgc7psLsKMGabixYaXZHqTpkakbPEFy67rVoCLlFurNhotp/
	7oSUAQ+xSWZxPZiS3LZ0+f1Xti6LTUjn7J1G1ktXZpdRW+ADPQQH+4TWN47eBaNDIttiLX/gydg
	ysiKks0lxytJ0L/G4Jj8AsHLp5p4pZxXDookl8Phw2k2+/RBM4BvZNCwqHATnM7s7nl6PFLQU
X-Gm-Gg: AZFdTZdWsSx6JGJXaV49c8rqCsoBQIskStOc53q0KXk1bNeCPWQtTO7Gi87og5OKMYn
	qnAK8DqvMssEon1auDaZHwuDJ8YHELj7AWPSTw42mRVzv3wc+GtsFKvKIPX1F1UlaUEkj/rm3yd
	ReuHHhb8wLMDhYd7OYvqsIdiVbqOZ+BTThXfpn0GnQGBMLhQFR9Bo2Amex0Fcv54ql/GkpktMK1
	ofxqdUMt2ac2JfJFth5QIEqSnn/wFtV7aRQdD1umgnbYo+btbbKRMH2YGXI7IR/02DHaKVeitoc
	cUYC2SNjRuHHy6ZfDQD9zhHRkFYls9Fz9uuioP1LarQlncZNiy7CHDiDh49elXU6ndLwiXfF0Y8
	3AAYo8KnWYoJYID+7H4ndwnqqsjGAXcnL6ua4sE4nVtaTCt+QqyB5HS3QGdQVsUF0/Sb1SyYURf
	yEnyRAQLpSJBTURKkoWqTx/V0SDYyy8I2pjOq7U5kBPyaCB/AHPCvTT+w68rq9PQ==
X-Received: by 2002:a05:6122:893:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee8af4d132mr13026193e0c.13.1795702139188;
        Thu, 26 Nov 2026 06:08:59 -0800 (PST)
X-Received: by 2002:a05:6122:893:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee8af4d132mr13026141e0c.13.1795702138655;
        Thu, 26 Nov 2026 06:08:58 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm524644075e9.2.2026.11.26.06.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:08:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org,
        Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        j-keerthy@ti.com, nsekhar@ti.com, prabhakar.csengg@gmail.com,
        avinashphilip@ti.com, sujithkv@ti.com
Subject: Re: [PATCH v2 0/2] gpio: davinci: fix probe-time IRQ setup
Date: Thu, 26 Nov 2026 15:08:55 +0100
Message-ID: <179570212798.21589.16916308704407177260.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
References: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dED8CYL9KvEwQmNj6kKgyaLvIA9wDSD2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXx0rv9+u/1uKF
 1UCtbvS1y/K2ubpr+zBzHPZvSxbkjNf4NV3HPGsiLOQjyaMENOxa2i427ghBwp3p6W8NlzxHZCX
 1lwvu1pY6ufAl0LFgfE/XUoP7esWXGg=
X-Proofpoint-GUID: dED8CYL9KvEwQmNj6kKgyaLvIA9wDSD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX+qPoHPh1qeUg
 r84SfCbzxpScRuF5SZlx382ghuFL8YWOjMnDUM2XWMBiKpoe19mbEQwjXakt21Oro5d0cJM3Eua
 VIO5SuVSqkFbH2jLRTIcx3p3EiHtYUAHYugFe7hvCsfiRTU87p+aR1SEaNjxJp43D9iQVKGOW0v
 HtKVGwNsEg1G41mA1GTmL48Ytb65OzFts1Om952G7y1wdX0UUue/yebdZQv4gy0mnC7SkRcoQYQ
 7TuoRzZTFqsXV/tRhLMftpT9t/xFezmvHDI9KOfN1MVrHufqLsmb/RGVxsyEEduTdgEKGXje0un
 BSguDrv69UOpE81cHZ7TFsvu7fLmTqSB7ase70Q8/rj1273U1HwoFbbcTAfz8GA5f1L5UMOqDx2
 w10ILl+uvffJ15i45T2ceqclF/GBlI7vyEGtn5fnPLka6XDSdcF7zb0hCYJgNFWx0UdL0ayT23j
 U4+QivpNBjzvNgNhaOA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b083d7b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2qz6BBfO9x0p2zejefQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Tue, 24 Nov 2026 19:06:52 +0530, Sahaj Chaudhari wrote:
> This series fixes two independent probe-time bugs in the DaVinci GPIO
> driver:
> 
> 1. A file-global MMIO base can be overwritten by overlapping controller
>    probes, causing BINTEN setup to target the wrong controller.
> 2. Per-bank IRQ data is allocated as chained handlers are installed. A
>    later allocation failure can leave handlers pointing to devm-managed
>    data freed during probe unwind.
> 
> [...]

Applied, thanks!

[1/2] gpio: davinci: use controller-specific MMIO for BINTEN
      https://git.kernel.org/brgl/c/a142f1c5de4b9c03910cc304a26fbbdef69ca422
[2/2] gpio: davinci: allocate bank IRQ data before installing handlers
      https://git.kernel.org/brgl/c/9c5f350322837c83882e350f11f10cb29ed7f9eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
