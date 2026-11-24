Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517595;
	b=IiQEmu53adK8LNb3Z9I74wa05HJdaFxAkysDxKY3iKmZjyLJik+cMJfUs8Q3ofYQzEo9
	 SZIIkB0O/GtAzFRqtgztY+ujQxiWB9FYDezXwkVZpHRjE8rTMatrcjXKZczSC0bL+tFZt
	 bjSdNntJMgijP3EgEKl43ZqUFRV9kbpfgsEgvWqsJTJ50lQ1/P06lhcy0sf5ReoJL/ECT
	 hsGxfkndohfptJGky/XARH0fHttByH2qbZkIa0XCzO9+ET7Br/stuV4h0BHzA/goEdQuX
	 SBDM/hw755SRdeGSdt7CFrYO/HvitbCjP0T5lMni4BI+bsVIFl/pW5vPyCyf2Ib218g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
	b=B23bbwlXiUASKn+BXAjQVbnlCBrfCWOL6iJKhG499YD2K0vg4N3t9E335vkaljecRJ7m
	 roueqsL8sULX4IvgUgdQaVSTWsx5troDWu4WIPkZ9uIBxxB049ZUVaOCvPkLpixubXa8i
	 3S5Tv9PG/MGXAiKYZgVAwXfMSFwcnx80AA3Cy4XqydCVy/7ntnHPwWUj+qXebJZJYHHzj
	 OzX2noCyB6LxW2qo1U2I/RfqnrZac5NkoNcdZ4hf00fcbQrhnOYI1pPMnLVh3m6UZsoTM
	 cYB2a5sQvMtnBS35lZTOnQ2hTq+R3YxXcXLLDE8f88HFCK74kTQKEJKKgSjj5KtZ5PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcdjbbCF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4CDLqNc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FB0606A326
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FB0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcdjbbCF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4CDLqNc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8R7u93701196
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8
	Nb2PLcPQ=; b=ZcdjbbCFeBkHeEdI4eqLkIstKBiJ7lJtG5BkB/ox7z1NZurQrYQ
	Oh38tErfA9R5OebUUn+a1ZCve0EGK5tSMLpKYKc84UzjjZ424oUQ9Z6CSwnDc3Hq
	xSkoBdaSa4H+Gq0opVvTTAs2V1tha7CUIkfSUO9G4G8hq/5KqRg2LKODwJAI/OjJ
	X3B/whVU3ct0X+/eYCoAaHvb+iyvn2lB7k1VGJ+W4o26u6S8etmeLr27/iGS7wUZ
	owrih+TJuKGdnihPc/OXb8VSUPhJGth8e56wvyRT0tvKz+dk2HSzogznv+NcyOpW
	fqGOAHZkqCxEgS7C6L3g0XjIzvQN+GUKlEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky260b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so4435645eec.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 02:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517593; x=1796122393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
        b=D4CDLqNcrlRgIfEsJKBpsgKqGbcP1hFHAzw8oJSVG4n4EpkUo/VUsJqjTLyJrAHEZB
         RMpRloGUE4caD+E4ynbe9/Bu+Vfx1FChoTORpiEL6iGMaFG+B/mTO0Oy+LRsWgXJmOWl
         jI0YSlYEYafrcAmv4t7hbLGa0qWyRGsgFB1gjWRIODyewj/I02gBzc5p0t3z5JQC4s/9
         BQLXHfAmuKoiJ6Uv3pBb3i0HAzhz+tAje4c4Po0FKPg/MORFijiLfrhoDXDFpZ+E/MJF
         pBgfApEdwP/OoaeZcLYyLQck9/g3NQvh7MiitqQpGRYoISU2oLE5Q26UhSyZq2Ah1mP1
         s2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517593; x=1796122393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
        b=fEn+WLCdlNwB/emOacj+t50IXSqB21R/GDcJWJzO9yKAehRic7XxXB6gKnl5ZhsY2v
         xSNOUq3qXIHX35EK3D/PrnOfoBg9yGbBrsAMDldUxGGuSwmSIRj51UjTz7/KbyN1vpDs
         6Kr5zoD9X4SAD5MQREx2iJ3jAeusJtVFAWUBMA9hYNIBzW26intdzdRZPmwJ/p81fnwc
         nILD9kt0+Yvq4J986qHfNy763NbFzBv0qYBi+ycdOg32tQ4zJ1KRQWc5FPJ152eDbbOe
         xgIiaaMojWzWzrgIl1BvGg96oeSfZ0aov91d0GXbntrIPM2iQUG9IekZwsq0p1DXLa6r
         i6Dw==
X-Forwarded-Encrypted: i=1; AL+hErHDbnqldNnk7XrNxbpQ0WM3CRx6tK2NkbyJt9g6xyVC3zr5S3VMaZ47ZxFx9L2dy124Dp4/erFHmp7G@vger.kernel.org
X-Gm-Message-State: APuU4Z/nvhEiw78fZjFJtxTYfYhLiHw4AZ5ZjMwN9UH6d1SQIbHiKyzM
	dDxKmzfs+FWrhCE9mAWPWUm+YeCw5k0krK4pHXAQSeRL703e6z9PHq8SF4VWq/xDIV6SduZUplj
	SiZYU8a/xGwRlS6GxnaQ0SsQ9Cm/fEUpEn9515mqpcbCEO0JlHGvIucQVlYAk5Zsf
X-Gm-Gg: AZFdTZflQts7O2hyDsG3tdQWscGSoiPGhnA0islwmw9F+DjCh0G8PdHwFSJc2LgKNdJ
	ONRyrQ9pKrBRGOM4zsSUH0mOEeVDcRoJYWVwkMkm8oJ+iJL+gmkG/3lHsR8ZF5g6doI3pcCkDPZ
	vrOG924MrJD5qvkW26fOdWpmrFjD1jorxdnK79eJqSTWoeJFC7sDrKuHp83EliSThXEePET+N0f
	AJzPn+K6P0qT4/Bvfn30NKyHO662FIM7+1zbtLZ6oV7cPiS24zalf7RHHp+ewsjNV5UcR+3qH1G
	0gIHQIZdsw4BnGf6vNEpBajpVKzJVUlkEdrGQZ/g2P2Bn+QtLj7kZKYQA88osWnqne3QRGWP26q
	ZbLGf2h0YuO3pHl5I36PpXtCNaChwVjScpTpXqcEvdnYp8elDuKQFgC+2S1KXxGvQxoali6jrgK
	XMtkkd3c83p0nKtDrBTIur2xYDEHrGNHHsniPYS4ZFO3qDTT3HUQUA+cbz
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr14232615c88.20.1795517592583;
        Tue, 24 Nov 2026 02:53:12 -0800 (PST)
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr14232592c88.20.1795517591912;
        Tue, 24 Nov 2026 02:53:11 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm35075998c88.12.2026.11.24.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:11 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Date: Tue, 24 Nov 2026 16:23:01 +0530
Message-ID: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b056c99 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=lHObh2IfMKzVuqTG74EA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: n7kBqiA1Tl-t-r6l2zHyZ6RcOug5LzbO
X-Proofpoint-ORIG-GUID: n7kBqiA1Tl-t-r6l2zHyZ6RcOug5LzbO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8z45y1uK/e5i
 sB0HdjyRJbs6fMMGNOaw6JDPqfV5QmIBUivefOdRcWUkQZ6VtUESyptLMGBHUCFX81e86vF06cf
 EWgHoJXfTgZ1RDvaeI20qM4vkbmNwmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX1K5yqf0hgedc
 MhVFk4/r68o3cO4UusrCtA3Mc8MwG/1H7vV0w+okttQa6zjFPL1RFMTxwX4B3SK9jJHAXggQTud
 e0z/s5WkArTlcj+kr5elRXUxdpHNgDrT4GQAX68jw00wVw1MJShhAkv97hVbYPaTpLozcbE3gPY
 OuFIqd1a8p+sjkkVElCQZgjruHmK62E5YUonSbTXRTNKeuVUhpwiyl1x2Fi8E/7D48JuFVRWff3
 ncJ9HKGUQUQT/93el1/4kNhm+BMf3xqJ/R5vAjPYqRoJ6MQsVrynaKPXZ683XUtNXACRV/Sbs7L
 gSnkSQ4yCs81wo/GwVKi14pe5xyiGnlLLlJbmaDBPkNxIn4OTG0L2v1nfct93x3917X5+lRH+GE
 gUQwHFKXtu/U4rECqImYxzInJu9GfrzNqhAnVr4jozFR65WO/f6bJmeJs1Jw3LkI6RdxhGFVVed
 Mbhe5+y0ijDBgqdjldA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add the TLMM pin controller binding and driver for the Qualcomm Seca
automotive SoC.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.

Yadu M G (2):
  dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
  pinctrl: qcom: Add seca pinctrl driver

 .../bindings/pinctrl/qcom,seca-tlmm.yaml      |  135 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   11 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-seca.c           | 1705 +++++++++++++++++
 4 files changed, 1852 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

