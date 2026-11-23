Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447364;
	b=GUP8n8NXLn0GFNIkqHtdKwypwGzW8mE29aTTJCPLfgvKIqTnPtptIyxLrs7EptJrTq29
	 wm9OMVZiRrouKPwffWTsE0D0Woyudvnyj0dQLUh87nblUw4xAY67P+GnYGtIHbVGVmY/d
	 mwU7/jTpZDFApvDxxE+T9Ry8bA5oHDkVWzzRN2HhVO81kW656wtvUgN/6QDRAqQKFTgzE
	 rc9xonKFWhprUt2NgTQtexKW9K1bgXv5ULXy11O2X9BarhVxAL0NLWgUXwDdiK9kPorY5
	 l7qIM6O2Oc2x7lVJ8HB9BiRPOySCxD3LSgJjgh35EpqEdd367PqsfEAuOFZqoiRke1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B0vDMs+igaYA+28vUGIdjnaabGanSliMe9F6/NhBAEM=;
	b=1dLKstKi22JR9swCUwjKsPi8R1yVCb1ga3X6dA8/yYWlFFLK5r8mb+tXIcradh8CLAwp
	 Q9YgFU9yC584Xy6KMHguoQ/NQRTraaCJ/lM4muC6d3Y45G1ZDviAUnOtjp5SvQ2AxD1/+
	 KXK+BJPKNcjezUV4k0FIktTR9J0avGctm00nzw7qZ+EaRD3v6JFpTLhJi31/4y8rdfZYP
	 KiYoLK1rTgsfU6zHGEk7xHidxpvA8VMUGldCIR/yD6QbeOmmrI9bWS2oFNHM/yhIMNQ/G
	 3aOhouVYqDhQC2efeRHCKFBpWVRVPpSDxuiPbmY6LzAiPla8HiBMStce0wQJdEH++FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKRKNDNe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EazubB28;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD48606A32A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD48606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKRKNDNe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EazubB28
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKwtU3329322
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0vDMs+igaYA+28vUGIdjnaabGanSliMe9F6/NhBAEM=; b=pKRKNDNeUnPfQ9mb
	XH8iE+F80am50UZ3mMiCo+3v3OJKqvY7idXmOwqANSvjV3nXv2KQ4vvmjXYh56yI
	pc9eqQZ3ypZ1Bq0heUxvvF/khk5Pdfz8/+bhRp3O8mw7DDDwyudqDk4L2ohK2ts/
	BKOvglWmZOe9vQOKAHNEpyeGvcQxH/DlU9AlVvR/TXXu3fl7sW/EqvjGlGJUsafc
	8pmci0wxw1Dr5UVZPKNwCv0136+W60KyJbODjyB1IqoKHdDm6dQgvXv23pQq9k2A
	UEzPmRgaobE0LHD8asX7as8ZKzC6FDTIznl+lDKUv9MS94HeWlUHtgYXPlbc29lI
	f4EFfQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd228p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:22:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee4ca14454so94592e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447362; x=1796052162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0vDMs+igaYA+28vUGIdjnaabGanSliMe9F6/NhBAEM=;
        b=EazubB28DOokzZsadaGTNecS141IMyYX1a4xZhT7GKSJ7Ch6MZ5424s6HrzHTuZS0o
         5tugX0U/YR6vnSk9nlxppVfbtVXw9Kaf3UOOJ4ieiTRYxBG+xK4v9FnobkUq2w/inhlk
         kMElFvIbmEthYPvFUL10/pAf0sWMzIQgNz9gorJ2iweKPBCBqD/nbQYJFzxhfpmSslO7
         InVMqRW4vcvmpRer5kglVUaJppEpjPuBCvbCOxaJyK+8PCZSEBfWoXN6lHEf2S0Mm0Cr
         p/m2BZPwrVuFvxU+ia6X5DodvMi8mMLVdNrCkcKzvWPm5jMOu6CH9ZoKI3nhPF91S6Cs
         nvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447362; x=1796052162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0vDMs+igaYA+28vUGIdjnaabGanSliMe9F6/NhBAEM=;
        b=wSY+j7rQrdxC+j1A/qcWu4ZO06LTHJdaYU2jpL4Iy3UJDsgJiIOPQx/Pk6ulPz2iEE
         G6dp8niZJbeOMqosKufE9zoEm/LEzLwn/qywRiERNlLNx00tMwDzJuNHS32o9d9GaMgA
         9qgOAoARzGcAzHYjaImhe7/wC4+qeLj5PmMs979Tm31UAk8whAOo6vGdck+Mk8mqM2+/
         lKYYbCbM4lHdrMPSncO1kCey/Eb/qfDJRLmxKHwteypdJbC87/59uOT2CShB8N2HORum
         1NmaOS8xnIgP8HlVXkDIRZWGK0EyFeYuoraU8r3cIk13EsJoDzHl7uo9S9BiKrAb7Fqa
         6z2w==
X-Forwarded-Encrypted: i=1; AL+hErF3bsBP2esUyxBxQ9+efh8fAzGEcoG1vuTQ7iAPp0Iy7HEDVQvJI8eVcZ9/TImNqkqoCH4Fcynwa9RF@vger.kernel.org
X-Gm-Message-State: APuU4Z8BEPTY5afuXMVyqqLoLaz/FzyS4giR78Tar6KgHvSR+3ByuRbL
	kYk3+TtdbCbEW4Sfp/1ii9c1ZkSgT/HJpE2wWSqz2nXi20/aCS2jBk2TYl5xNlqZdw9/BPjyWID
	0EZH1qv43Q3C57m65G2IVrNh07j3my+/GWPYG69I/xzdN/bOrbRkFXwi0NlhX8UYA
X-Gm-Gg: AZFdTZd+Jp9JmlIu3fEHLGodoiH6zhsO6v3byZbI4gLF5KcFL1Z8vDZo9I322AzAljM
	uavkbhe32OpGmbdDtVhx2FMH24iBaEfHgMO9+StP949Tk6grdZ+Lgdtx2nqZtsbfabDkEboAFW+
	DoaCt24adw1nVIXVHWdkhsvM6oOMdYMcc7eg/BVn9Lt7Ka+heC5YIW6NNp456a5YsBRyc5wz5ng
	eHabgwEl4KofUbiiHftSREqd7UpLiHAi8HFYMld/g5qLfMN4FXaI+LNjSOLOCxbCziJg1Mttsg1
	8DYpzn2vg7U0iJayW51Y8dbu1GZJ4CsSzvU91H6zmpMUSTLz3g/MZZEO9qOngbLeldpxYaRRHhE
	2qnjMzkCyfhKEcJjnkBu2IXKhEj+LjIMbUUpDnfVOrXKmaCIQgOq5Jypl59Ow0Px971QxeT8=
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr6159256e0c.5.1795447362448;
        Mon, 23 Nov 2026 07:22:42 -0800 (PST)
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr6159210e0c.5.1795447361968;
        Mon, 23 Nov 2026 07:22:41 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022b2bsm422901166b.83.2026.11.23.07.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:41 -0800 (PST)
Message-ID: <67d2efc9-74ea-4335-9240-9ba6b480b28f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:39 +0100
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
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: Consistently handle IPQ5018,
 MSM8953 and others
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-pinctrl-v2-3-958e205b1f60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-3-958e205b1f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wRM10Hg1n0ZEBqeTOKlKko5_kr41TURz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX41S1q2BtT+iq
 IinUb4LebLFCXHfCgldfpkfrcj8/QvnSGYIt7nZgZpFONU2/E6QNUEQLa1hMOa085eGdQsf09gd
 pESNqX7GoANw9NLZNe5cJkF88DNQYkhvBwhevr1J/EwxD1ftZS72Xy36Pk0erMQB6rN0Gr0qN+F
 u1IAk0eviHBubiBXa+C9ECkuFu1ozW3NEzG2D+8+aFvyUTevaFDpvRn07X/5asalWA4iVe5HPXH
 S8pleqx9CaUXImwAgHMbdLx7SKMO0Gv27eLpnxKf9QGl4SFPEniNAmTdPwsImblPaEwFZh1myzO
 84TpNjcEUhy1778bzI599j47GcPa32HU5E9XYT2KkC4K3LfIicp7j8V4OdBbMOQb8UlsgOwOA6v
 xh5f3Ms3DxwYCKj/xo6hE702oKKx6Dsa1rY1Tn6kofiqm5ygmp78/WVFWaKWCUMhEU1bnXS9svd
 czXshz+Tje9OruuvBUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX7anh/UwHSPHO
 atzAEeGlAnFasqnO6VQzZ/RSrAr+Q99dsZUG/pFRbM71ElYvFej7IJE8rNh/yJWwGXaujOXU0gX
 7K1+YM3W1Nq7fCZT8YiETyfo71WUEYM=
X-Proofpoint-GUID: wRM10Hg1n0ZEBqeTOKlKko5_kr41TURz
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045a43 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1D9KFhC7uxUtrrzGQF4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 8:44 AM, Krzysztof Kozlowski wrote:
> Other critical drivers, like clock and interconnect, for Qualcomm
> IPQ5018, MSM8953, MSM8976 MSM8994, MSM8998, QCS404 and SDX75 are allowed
> for 32-bit ARM builds, so pin controller drivers should follow.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
