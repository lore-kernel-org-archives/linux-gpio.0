Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175213;
	b=cC2qgB/B+CSWDDn4y7HcyRYjxnHBzwWFoLvI7pzSAkWy4Mkw9LRD2NUityKHkgmfJx2I
	 zCUBiax2JvtXX7iX/6u9PRlPhhVdI1ezbwKlgF5Vrbo8zhFT/bZjFhPZWc/SSD+g/ByAZ
	 vdz5SfCgHrFIu0B0n+PPUowToGNbGrsJq75k5ELwKsaZJ/ZvWX66lYN9W8xr3huak7wvr
	 iN71KiHHukA+x+XG/YEO6h9tFr3vpTRD5+92epQXYZZ2f6WPCWfOOGrx53qEksV18rRRy
	 fKjYQRc41lI9/jp8NwNQfYuKju3e6Y3+oQZ2acH1PgiarQFCBgVsomSm3VEKufGP7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Xah+LetHZLHteAsaQNY7S9Wg1ds0grBGkF3uRrlTho=;
	b=nBwZiDLtzYQMG6jgYdDbdYAWpWL4nbsvkbHgIvDsej4c2ll+s+Annb7oRt/vrgxA6Q4c
	 +TXaj9ecEdBbTzHShk/fmzjQN1rKixPCOuPYDjQajOdUabA1suobe0vMGOG0DqB1t9QqN
	 MaiLJdEVkhqlywAA5ER6kYxkf9dvMIMgrSUyW5S32xtSkm1O+wowmnHRPZappeoiwLkTN
	 aaiLLDhGCJZEBgJifSkRQQhB5WkDbvCehPBj/kmK79QLo18o7L1CVE5zOl/oVNykk7Vcy
	 4Ct6zYz1teeRlfj7i0zBHR3ahH9L1ZEgIpOVB4MsS9PCwO6ywkeZxaXWKJ1htixe5GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6yckZBS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wuk80fgo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E730606A326
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E730606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6yckZBS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wuk80fgo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PT7h1133786
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Xah+LetHZLHteAsaQNY7S9Wg1ds0grBGkF3uRrlTho=; b=c6yckZBScg2CDBS+
	TBgjWe8vOWOfcbJ3tmyTIiM7sfp7XtFzVH1MOTcXNT1K+QAPDh+tRmD26aSEzihK
	/irAGTYiVrjnB30l+CKqzQve0bi2xiaPzMpspTSacsq89EBeYaGEM1R528c/wYAz
	ZXf9QcYgpuyPk7fdNGzuVYXb6+DMHazsnUfJUQ6zMAxu1CVNFLwz/5l/722bYZ0a
	1kp6M8UQsSl1XDZgzr7ckTggrTOvZ02tc87jJbOG2589vcQOObqZd9DezdSDZU9v
	fsi4rc6x42vhb9Y8geYzPwpZq5aXiTmWrIkLrcITX58Giry421ByJD64xKSdHnR+
	hMON1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpu1n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:13:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso342558185a.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 01:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793175211; x=1793780011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Xah+LetHZLHteAsaQNY7S9Wg1ds0grBGkF3uRrlTho=;
        b=Wuk80fgoYMdkQhGmkJjTrn6E8jQSK2P+2MUnRRCdNN85FGVL58ezExsPdH9SXli1hT
         myinaOjwN0QoGO85YseaRzYy6P5PHz/7GzhDDCmhmbo8DFasUyQaaHg9chDPAOV39C41
         0zgMBkpLwQPRWkJ5u3HECTLRrk9rMH9FHAX4DQ0/ipbB3B+UuuOfmVU2NMa7LioHnxrd
         29tjxUO2IsrC6wOY6hlOnYKodZRCzfy/YXi5PJfJes8Z8NE6leAU+nuTzEMWoz6VZotl
         mSABt7sHz9ePYm/LHVO1HKd18axp9MMgyc1l44imhGHXsFaL7kzge8e8EHwoxVpx1o1M
         QGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175211; x=1793780011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Xah+LetHZLHteAsaQNY7S9Wg1ds0grBGkF3uRrlTho=;
        b=JIkKE11pJ/MheNCPUKavon67m107xG39wVHBfhIG0V1sU3e0HJEwIYc7O4oZiDkW1O
         LmXrZDin2g0D/eMqflm6YC6IuooKp9dDtAEHa8gKbQHTHZ2SckYgq6MF5fTVRVhPnLZI
         ONbvJsJ9DYm4sq7ybREd7EFUEGyXOIRzTPgWrXcI/9Qp8aepOBh6vwcU+xFTLLFawG0t
         q92YkiEwhRB/lYLikRBjaP3kNt6j7N5/FXJUG5Q18po/IzBHaSgT/+0gQ2XvedQo3e/A
         grPcTHrqhmudOK7Q6qLmYFgNbSG+WjMNh8+8BWscrByEo0T45D23hd6QqHnSnJ2BjzEr
         6Lfg==
X-Gm-Message-State: AFq9FYISSqDRKbCqoZktk01KWiOnG/cEBGggrodEktGfuz+UEQ1iGRMr
	SNMnJdZ/6lknhSydTJRiIWIqqqo9ilJnhFcRpmv3kxeYMQ6PXaBTa7vhXDzvLDeuNk4YoUL8HcM
	tnoRmCe2u5VST3gMejUsOWEZQu0KvPxPn5bDvzVi9l06hw3POOY8+ZUx7NuEPpetT
X-Gm-Gg: AYBFou0df/umcBR+IBYzWc2XEE5dYZvGZAenAnxIICjGn53Gk268dJ/4t50hM2xo2bH
	G4RQY/IuS1OKzLkEUtrAJymdjsXEl/Iu/sfJ/+An1iA2hG87nd4KDL6S+l//3hSiAYNVLSDeag9
	mc8AJ6cdXHyWKu5OcYNHc2pGI1yidNNL6JV67fIcmF1S877s2spH0BeOn6aBaPdwvppB+GHDz+1
	DWuEZshNsNGbZhgVrTofvdEAr9hak916cCbRY4zq4pXUTDoKhk/OYVxHPoKiS+h01bnD1rYx6Zf
	cC9N7tej0IplV3rAP2ZDCtUGU1Wl+OiE4xfUj/e1clr193xE85dd7t8iDg4s39Mnb5qqizOB4U+
	etz28e0Zt1JR16sjUKgZ74k1pBStcJNFTHHWCKoTuTe5rUIxzXWvBVX4G6MRJe3qWsWjTe+vaAg
	j7
X-Received: by 2002:a05:620a:3714:b0:93c:5952:5765 with SMTP id af79cd13be357-943f4a05fa5mr830465185a.6.1793175211476;
        Wed, 28 Oct 2026 01:13:31 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:93c:5952:5765 with SMTP id af79cd13be357-943f4a05fa5mr830462985a.6.1793175211017;
        Wed, 28 Oct 2026 01:13:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a976010d2csm29592795e9.2.2026.10.28.01.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:13:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH libgpiod v2] build: restore function and header checks in meson build
Date: Wed, 28 Oct 2026 09:13:28 +0100
Message-ID: <179317520609.5134.9462807000038589464.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023-meson-func-hdr-checks-v2-1-439b13a52368@oss.qualcomm.com>
References: <20261023-meson-func-hdr-checks-v2-1-439b13a52368@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMiBTYWx0ZWRfXyrLr0rJpF5qG
 hB/lfgjD2iwole4LR3zFSEvntiE9WzJBmjSa49BRXYVsoNixgLldBOqYDKdzveEmkOe/edIc65f
 pTo8q7TXGgiGbWI6QkJvrAlzHc8naluNo5S0lu3BmjlrbhJ8UO9/CeIj5x8G4Dk5n5w/n7d9fON
 /HAjR309zs6h9i8c3Aj6Li3fRz1+OVnHEWg4tAMV2G2P1YRz4/OY5qnn+BUApYzqF0fqv0aQ7M2
 NYIIOxynVD5yi96Kx1YIg6x8rKJRYkg0EA05mCLVeV2NDtmqXaDdmfvS1DR5y07YNzVsTdKboCL
 SdIe0V9mbdj5jPlZofCSvmHa+jYV1R8xf2ofTBXIchVtvAjvuqiHoyfn2Yx2Lh3rYcKvinRnNVH
 l7D+1XnMXsFuNO3LS4gyLzzjh1bKeyJEhGmbMCTpUiPEIfI+d42ERzkXBQ3ipc22dgvgbiBNWix
 lZchjFOx4pyxiO4dzyA==
X-Proofpoint-ORIG-GUID: TnxmDiGAeqhF-fxeZlwohtGeiAjEU-q-
X-Proofpoint-GUID: TnxmDiGAeqhF-fxeZlwohtGeiAjEU-q-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMiBTYWx0ZWRfX+FRl9CP7MKGd
 tcdEjWWUg8dO30p+hWHwRJIJtleGO24j/VdhipE7xojNNSpDdmY2rtjxAOWRosSmHmz2HiTuwyb
 +EMsNt1/QwQEV70FutQCm/aWVe1Lv/Y=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1aeac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Dd-wGjPMx-2V28F7M5UA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=O8hF6Hzn-FEA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280032


On Fri, 23 Oct 2026 12:04:19 +0200, Bartosz Golaszewski wrote:
> The conversion from autotools to meson dropped the AC_CHECK_FUNC() and
> AC_CHECK_HEADERS() checks from configure.ac. As a result, a missing libc
> function or header is no longer caught at configuration time and instead
> shows up as an obscure compilation or linking error later on.
> 
> Bring the checks back using compiler.has_function() and
> compiler.check_header(). Keep the same grouping as before: library
> checks are always done, tools, tests and D-Bus daemon checks only when
> the respective component is enabled. The pthread library check is not
> restored as it's already covered by the threads dependency.
> 
> [...]

Applied, thanks!

[1/1] build: restore function and header checks in meson build
      https://git.kernel.org/brgl/c/bdb0b7677598199842b5bb107b574fe03b81ca8e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
