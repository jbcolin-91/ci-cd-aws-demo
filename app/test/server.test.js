const request = require('supertest');
const express = require('express');

const app = require('../server');

describe('GET /', () => {
	it('should return Hellow message', async () => {
		const res = await request(app).get('/');
		expect(res.statusCode).toBe(200);
		expect(res.text).toContain('Hello');
	});
});
