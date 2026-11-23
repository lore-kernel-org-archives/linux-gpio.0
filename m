Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445340;
	b=MjCC+QXv/dmnlG/bUhvoYKzcbaG+adPG+Fs1ytqiy1bdXHLl56bFQE/Nd27Ic14YGDGV
	 XX0OFTEK2AJS/OJqziaZDk7i2NPgL7ZxBSxK6KqkqjzPKQUjlSqvYZLKls4bhAKN7X9l7
	 QhvrWHL16JPf6CzbRZaWYOq9Qee2Hrxz0fJL1R3JUj9F9MeMNw1CyqdlmnMg8V25cIAyj
	 n3CAP56g3FQllTSnLGBgf9TsTaChWSKnxo6cepeQ2CDKiP7SqQaT69MXqSAjtL+jzA5yA
	 PUCCpE2sfsiHsAPLGbAB1zj9D18PwmirojM2qWEkUZUJzT9USRydxjc1sdONaqDIWiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
	b=zNAH4XDtX4OYADYrv/9YbdPSpomBRwzdxyM2o7MaPFmadGPSHltxR0CIwsbGdRrgWmwW
	 1Y4EXuLJtyEjUMFA3n2qt41DZpFGHN5mm7StRKyhk7nxSCqMycDEb7CSJCDs43ItGBWO9
	 QtFEHJohLAtQXXXagQ9mGfFPO0d9+i8SgWyn4rM6W9+eIcfkWFyHWt6VTqI6GFHIFnnfR
	 k7+oLtt35yYgN1afx7sGz1l/suj86Pip9MrES9jyeN2LxAYJqEQBFy/io+/hhQ0CIjuBy
	 xlReb7WadHHHop9ceD3NxCfTOg5n5AvF3ODpccLC27kJlF/aNk8rDyOeXGcGGwPM+4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0Sm1c7J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjS8a3QQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D44606A321
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D44606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0Sm1c7J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjS8a3QQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKpPR2621967
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=; b=F0Sm1c7JRzX7fvK6
	XeOFGXUg45CR5LVVDcMKJ3oVzjSiZ8KWoL+W8MXqEDIxwngQpLsy9o9b30AVAhlQ
	c2nydHb/SMMdVZcgWOOXuQIGnDy8/Syrh4xE20VK/5upvKTve5fThoBL0eKuR1y9
	Tako8aUQFEjLZDtMS811xarS/V0YhoU8VS5z+nscFakKcNvKSOM0UGgNKVDGte4J
	6E3fOMbsFbhPi+P7hrdfDMo6szL2hDdJ7TiOyyyoQIvuFkplifazX450u5xeAj0r
	ggR71aUnECanCvVqALZFw3veWSHl9NN8AUAtft5mdwPVbgF3e6XElzBaW6Yu+o0a
	Yc72Sw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9wbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:48:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac74b0596so2356199e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 06:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445337; x=1796050137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
        b=CjS8a3QQJ/MDDbIe5tqqwX+7fb2l5BfWXZH5b1sOkfQxizgHb2SsJ8bDHCbuvmK+/G
         HCJ7Y/5t7vMAR2cuM8zGN90+hIhl8hvvW1nl4xRXHeUznFQzTTYlLZJPrMus9xUdM4cG
         o7IB1IzXFPGuDxKhydqakUwmrBBdw/aV/KZ0/Lvo3rtOrmx701DsBRHKhBmA90cyu5lk
         gtEGoBkBLiPhNQLOLlL4UlIt/cXBpxYXcCOQOOchsKQIArZWOTFBbQtxcH18uMvMc/Eg
         KcAadn+qQwvDGsLIqLJs5eCWZc5KKDF1Ihy1yDzZw6FYeFulCnpO/J2NffwbEdVr7PSn
         YZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445337; x=1796050137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NNHekqrvyyJz2o/Aa7zK+4dd8re1HAvFS2KNLCOaSk=;
        b=Vg5/proj/ZEIMgKz18YFQY7xCJezV9SvZ54ovKLlQMZe8NilVWUWk/zfL7cHXjvXkQ
         Rjo/xSqSK+66CcQP9e21k0155JgGEbzMJeNoaeUnbdEGRXMzVWpAo5iEx3hI3RFR9ZSv
         If1P4fVlPrTBV0QiTl1iKTmx75B1t5rhQ/k68rb/YItNavCRZX8uKkoYhlvsr4ZxKmFi
         Jwqhl0QJz9MTNwn53rEMM2ppSKGrx3R/CFmfYVVEE2FhfrF3nNGT13SoUYQomaT8fJl+
         ErHKjUyRaJziFP252TcK+jGeq0FFOQibq/H/PSGk9aVbzpOzzbHT9Uzd5F1TCmNzj0cV
         M+hA==
X-Forwarded-Encrypted: i=1; AL+hErEOkIWxNOZfTdIh0kW/WI8iDs/oSjZBVEypkStE3Jlsu3ymQ64ROMh6DW+ekgv6FXXjXopeKhyHo4WZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/AJ5q4okOi2WEet8yNzHq9cn7zfDApdl8JXpMT9Sh3vV2pYKWo
	BNNjYrlrtS6aEWTPcrbSpic2Ctt089L4cFj2cDP4hrKkcxeWy6k2S4cU9DDzxim3o9gFaGcr/8p
	AXl/NHSVRfKl5e9QKbMAj1N3HFBrTe0ShU9hlgljxvBLVqONXM1aFkEClJXazc8//
X-Gm-Gg: AZFdTZcV12IBTgV1jUd3PsHQAfVfGliR5CQMyOTxAiFdTHUQMKnYp7rCV8jAhZDvJad
	QCFi7qKKEqixYwf+FjsV3F/FiPHQggM3HeqPp2mugxr9EEU6HJfyJ1xOC+BYMGdEPxAKWCkzvWu
	A96E9jm+rCbD964XugZVRVNW8HQTPelrkfZ5kxZsNIYmCHKakljGARizlXpaWVOJDYZANluoOgv
	EBlVaa62w/01wxDWQvsEulyGuRBSGcklKnPx9+Tw0h8sAIjZNfFRkC1L+2DT2WaJXg3/y7yTd2F
	hE9teLujxAXo2fXo6djTK1JrAYX+ScOYOGG99zyyUHVHIXooaVYD83y3kLZ7sTBIoVLoxMXeX4g
	HpY0Bf4I55nYBqH8QWgkFeFVcfM7fZK5h5CQkZ6sNMHQqAfFUAHwMOFESOY77EcV0ynvi7d6Ojn
	9BW8EVE05QN4K/G5fZRfQpOZ29ncpbmf/Fe1MvnFLRi39bkFvXzns9/EnwtZoNdQ==
X-Received: by 2002:a05:6122:616b:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee8af0b2b1mr6086687e0c.5.1795445337324;
        Mon, 23 Nov 2026 06:48:57 -0800 (PST)
X-Received: by 2002:a05:6122:616b:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee8af0b2b1mr6086642e0c.5.1795445336819;
        Mon, 23 Nov 2026 06:48:56 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm176824865e9.1.2026.11.23.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:48:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep
Date: Mon, 23 Nov 2026 15:48:52 +0100
Message-ID: <179544532972.78418.5551704797974851196.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
References: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
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
X-Proofpoint-GUID: x2ad8M-P_R7aj2Xdtoa-DXL0VlrRiUSA
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b04525b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YyyA3Ubz8UxOzji9argA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX1rr/9HBua+m3
 1A53FfnBlQBfhyA+WB2ijzhInCS0Vc2gC9skOOFdX7Wye8P9FlgbI57cGLqLgeM8qJQEKk5PNLx
 fgi3gxmynX94IySXPZakWH42PAcaIUU=
X-Proofpoint-ORIG-GUID: x2ad8M-P_R7aj2Xdtoa-DXL0VlrRiUSA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX5fLS6EJCxV5z
 RmDMbm7uz8wT5LcKaGBUDIFFp910ihoDeZ2XV6mYB14yJuraHHgk5YGtcTr3t70cLhWxrWYNoaj
 3e90VmoWU/OLqrcMvUQIIzIA1cYimGKjZWj/QUOFE06A1YkH6X/i12s5zvOS9gdFRXJ2Vj37VeL
 /NJTP0B6V/z6CAxKcaMR23Ywo72zkTrvszmgkcroNlBD6irY0b8YXTsJV6YUCRSldVgZjl574Wk
 v8hog3/0sxPotWu28J7D7mkxybM5E7V34h5omkBUdHEPPvsQIPx6CZQNImk1YA96biO30ukzj9u
 3V32fBRlYomDsfGxHMQ9bpG0jUOfdeYPb1oBdfddd0jV81sNPbODj0kkVPFfHlf78ImDF8Xa8Zz
 qzvaiCyIgSJ2ZpwQ1HH5UWq/zg7WaRgVLQwRFqa5b8o3S7s0h80DY94vfar9ZzhzQXWRBxn0oiC
 25gZzUqbYJA+RVxjQow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230058


On Wed, 18 Nov 2026 19:07:29 +0530, Gopi Chandra Sekhar Reddy Kanala wrote:
> The LPASS LPI pin controllers only have runtime PM callbacks, so their
> clock votes stay held across system suspend when a consumer, such as a
> SoundWire controller, is active when suspend starts. On Glymur CRD this
> keeps CX and DDR from collapsing in s2idle.
> 
> Patch 1 moves the dev_pm_ops, which are the same in every SoC-specific
> driver, into the common driver. Patch 2 adds pm_runtime_force_suspend()
> and pm_runtime_force_resume() as the system sleep callbacks there, so
> the fix covers all the SoC-specific drivers.
> 
> [...]

Applied, thanks!

[1/2] pinctrl: qcom: lpass-lpi: Move dev_pm_ops to the common driver
      https://git.kernel.org/brgl/c/d4a6257af491f8a087d34bd5d3f4cd384d4fe266
[2/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on system sleep
      https://git.kernel.org/brgl/c/55d571be69fa9b1ecf8b417fdf768c4eb8b28d23

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
